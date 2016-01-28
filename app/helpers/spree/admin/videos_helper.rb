module Spree
  module Admin
    module VideosHelper
      def options_text_for(video)
        if video.variant.is_a?(Spree::Variant)
          if video.variant.is_master?
            Spree.t(:all)
          else
            video.variant.sku_and_options_text
          end
        else
          Spree.t(:all)
        end
      end
      def embed(youtube_url, css_class)
        youtube_id = youtube_url.split("=").last
        content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}", class: css_class)
      end
    end
  end
end
