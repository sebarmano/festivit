module SubmissionsHelper
  def embed(url)
    response = Oembedr.fetch(url)
    response.body["html"].html_safe
  end

  def thumb(url)
    response = Oembedr.fetch(url)
    response.body["thumbnail_url"]
  end
end
