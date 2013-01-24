class Country
  def self.show_country(name)
    # "Tunisia".scan(/#{val}/)
    country = Carmen::Country.named(name)
    return country.name
  end

  def self.find_country(name)
    tab_country = Array.new
    self.all_country.each do |value|
      value.each do |key, value|
        unless value.scan(/#{val}/).empty?
          hash_country = Hash.new
          hash_country["country"] = value
          tab_country.push(hash_country)
        end
      end
    end
    return tab_country
  end

  def self.all_country
    country = Carmen::Country.all
    return self.hash_all_country(country)
  end

  private
  def self.hash_all_country(country)
    tab_country = Array.new
    country.each do |key,value|
      hash_country = Hash.new
      hash_country["country"] = key.name
      tab_country.push(hash_country)
    end
    return tab_country
  end
end
