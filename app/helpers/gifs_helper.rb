module GifsHelper
  def linked_tag_list(gif)
    # TIP
    # gif.tags.map instead of gif.tag_list.map for making only one
    # query for the index page. Optimization
    list = gif.tags.map do |tag|
      link_to tag.name, random_gif_path(tag: tag.name)
    end

    safe_join list, ", "
  end

  def full_gif_url(gif)
    gif.image_url(host: request.protocol + request.host_with_port)
  end


end