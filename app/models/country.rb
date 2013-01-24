class Country
  class << self
    def show_country(name)
      country = Carmen::Country.named(name)
      return country.name
    end

    def find_country(name)
      tab_country = Array.new
      all_country.each do |value|
        value.each do |key, value|
          unless value.capitalize.scan(/#{name.capitalize}/).empty?
            hash_country = Hash.new
            hash_country["country"] = value
            tab_country.push(hash_country)
          end
        end
      end
      return tab_country
    end

    def all_country
      country = Carmen::Country.all
      return hash_all_country(country)
    end

    def hash_all_country(country)
      tab_country = Array.new
      country.each do |key,value|
        hash_country = Hash.new
        hash_country["country"] = key.name
        tab_country.push(hash_country)
      end
      return tab_country
    end
  end
end
