class ApolloClient

  def initialize(app_id="", cluster_name = "default", name_space = "appilication")
    @app_id = app_id
    @cluster_name = cluster_name
    @name_space = name_space
  end

  def get(key = "")
    map(key)
  end

  def map
    http_get(default_url)
  end

  def http_get(url, headers={})
    resuorce = RestClient::Resource.new(url, timeout: 15, open_timeout: 15)
    JSON.parse(resuorce.get(:params => headers))
  end

  def default_url()
    url = "http://localhost:8080/configfiles/json/SampleApp/default/application"
    url
  end
end