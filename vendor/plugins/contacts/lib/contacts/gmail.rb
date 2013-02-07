require 'gdata'

class Contacts
  class Gmail < Base
    
    CONTACTS_SCOPE = 'http://www.google.com/m8/feeds/'
    CONTACTS_FEED = CONTACTS_SCOPE + 'contacts/default/full/?max-results=1000'
    
    def contacts
      return @contacts if @contacts
    end
    
    def real_connect
      @client = GData::Client::Contacts.new
      @client.clientlogin(@login, @password, @captcha_token, @captcha_response)
      
      feed = @client.get(CONTACTS_FEED).to_xml
      
      @contacts = feed.elements.to_a('entry').collect do |entry|
        #puts entry.elements["gd:phoneNumber"].to_s.scan(/^.{1,}\>(.{1,})\<.{1,}$/)
        title, email, tel, other_tel, address = entry.elements['title'].text, nil, entry.elements["gd:phoneNumber"].to_s.scan(/^.{1,}\>(.{1,})\<.{1,}$/).empty? ? "" : entry.elements["gd:phoneNumber"].to_s.scan(/^.{1,}\>(.{1,})\<.{1,}$/)[0][0], entry.elements["gd:phoneNumber"].to_s.scan(/^.{1,}\>(.{1,})\<.{1,}$/).empty? ? "" : entry.elements["gd:phoneNumber"].to_s.scan(/^.{1,}\>(.{1,})\<.{1,}$/)[0][0], entry.elements["gd:postalAddress"].to_s.scan(/^.{1,}\>(.{1,})\<.{1,}$/).empty? ? "" : entry.elements["gd:postalAddress"].to_s.scan(/^.{1,}\>(.{1,})\<.{1,}$/)[0][0]
        entry.elements.each('gd:email') do |e|
          email = e.attribute('address').value if e.attribute('primary')
        end

        entry.elements.each('gd:phoneNumber') do |tel|
          other_tel = tel.to_s.scan(/^.{1,}\>(.{1,})\<.{1,}$/)[0][0] unless tel.attribute('rel').value.split("#")[1] == "mobile"
        end
        [title, email, tel, other_tel, address] unless email.nil?
      end
      @contacts.compact!
    rescue GData::Client::AuthorizationError => e
      raise AuthenticationError, "Username or password are incorrect"
    end
    
    private
    
    TYPES[:gmail] = Gmail
  end
end
