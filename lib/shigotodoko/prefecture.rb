module Shigotodoko
  class Prefecture
    def self.all
      new.english_names.sort
    end

    def initialize
      @prefectures = JpPrefecture::Prefecture.all
    end

    def english_names
      @prefectures.map do |prefecture|
        Sufix.add(prefecture.name_e)
      end
    end

    def sort
      @prefectures.sort
    end
  end

  class Sufix
    def self.add(prefecture_name)
      "#{prefecture_name}-ken"
    end
  end
end
