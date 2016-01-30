module Spree
  class Video < ActiveRecord::Base
    belongs_to :variant, foreign_key: 'variant_id'
    validates_format_of :attachment, with: /^(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})/, multiline: true
    #Add your active record associations
    #validations and model methods
  end
end
    