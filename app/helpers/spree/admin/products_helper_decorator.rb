Spree::ProductsHelper.class_eval do
  #your video association with the product. e.g
  def embed(youtube_url, css_class)
    youtube_id = youtube_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}", class: css_class)
  end

end