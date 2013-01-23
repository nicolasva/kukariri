class Country
  def self.find_country(name)
    country = Country.named(name)
    return country.name
  end
end
