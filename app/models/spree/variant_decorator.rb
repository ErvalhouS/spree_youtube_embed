Spree::Variant.class_eval do
  has_many :videos, dependent: :destroy, class_name: "Spree::Video"
end