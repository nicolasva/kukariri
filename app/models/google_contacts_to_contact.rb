class GoogleContactsToContact
  class << self
    def find(email, password)
      return hash_all_contacts_to_contact(Contacts::Gmail.new(email, password).contacts)
    end

    def hash_all_contacts_to_contact(contacts)
      tab_contacts = Array.new
      contacts.each do |contact|
        hash_attributes = Hash.new
        hash_attributes["name"] = contact[0]
        hash_attributes["email"] = contact[1]
        hash_attributes["tel"] = contact[2]
        hash_attributes["other_tel"] = contact[3]
        hash_attributes["address"] = contact[4]
        tab_contacts.push(hash_attributes)
      end
      return tab_contacts
    end
  end
end 
