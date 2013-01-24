class Country
  def self.find_country(name)
    country = Country.named(name)
    return country.name
  end

  def self.find_all_country
    country = Carmen::Country.all
    return country
  end

  private
  def hash_all_country(country)
    
  end
end
