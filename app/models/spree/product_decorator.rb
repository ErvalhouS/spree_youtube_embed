Spree::Product.class_eval do
    #your video association with the product. e.g

    delegate :videos, to: :master, prefix: true
    alias_method :videos, :master_videos
    has_many :variant_videos, -> { order(:position) }, source: :videos, through: :variants_including_master, class_name: "Spree::Video"

end