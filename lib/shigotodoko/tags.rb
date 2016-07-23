module Shigotodoko

  class Tag

    PROVINCES = %w(aichi-ken akita-ken aomori-ken chiba-ken ehime-ken fukui-ken fukuoka-ken fukushima-ken gifu-ken gunma-ken hiroshima-ken hokkaido-ken hyogo-ken ibaraki-ken ishikawa-ken iwate-ken kagawa-ken kagoshima-ken kanagawa-ken kochi-ken kumamoto-ken kyoto-fu mie-ken miyagi-ken miyazaki-ken nagano-ken nagasaki-ken nara-ken niigata-ken oita-ken okayama-ken okinawa-ken osaka-fu saga-ken saitama-ken shiga-ken shimane-ken shizuoka-ken tochigi-ken tokushima-ken tokyo-to tottori-ken toyama-ken wakayama-ken yamagata-ken yamaguchi-ken yamanashi-ken)

    def initialize(location)
      @location = location.downcase
    end

    # returns an Array
    def classify
      tags = []
      words.each { |word| tags << word if PROVINCES.include?(word) }

      tags
    end

    protected

    def words
      @location.split(',').map(&:strip)
    end

  end

end
