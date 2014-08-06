module SubmissionsHelper
  def embed(url)
    response = Oembedr.fetch(url)
    response.body["html"].html_safe
  end
end
