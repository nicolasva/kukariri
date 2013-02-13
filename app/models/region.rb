class Region
  class << self
    def find_regions(region)
      return hash_all_regions(Carmen::Country.named(region).subregions)
    end

    def hash_all_regions(regions)
      tab_regions = Array.new
      regions.each do |key, value|
        hash_regions = Hash.new
        hash_regions["region"] = key.name
        tab_regions.push(hash_regions)
      end
      return tab_regions
    end
  end
end
