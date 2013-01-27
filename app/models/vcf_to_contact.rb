class VcfToContact
  def self.extract_vcf_to_contact(file, user_id)
    vcf = %x[cat "#{Rails.root}/public/#{file}"]
    vcf = vcf.scan(/^FN:\s*(.{1,})\r\sTEL;CELL:(.{1,})\r\s|EMAIL;PREF:(.{1,})\r$/)
    vcf.each do |value|
      contact = Contact.new(:lastname => (value[0].nil? ? "no lastname" : value[0]), :firstname => (value[0].nil? ? "no firstname" : value[0]), :email => (value[2].nil? ? "email" : value[2]), :tel_home => (value[1].nil? ? "Home Tel" : value[1]), :tel_mobil => (value[1].nil? ? "Mobile tel" : value[1]), :country => "France", :user_id => user_id)
      contact.save
    end
    return true
  end
end
