class ApolloClient

  def initialize(app_id="", cluster_name = "default", name_space = "appilication")
    @app_id = app_id
    @cluster_name = cluster_name
    @name_space = name_space
  end

  def get(key = "")
    map(key)
  end

  def map(is_cache = false)
    http_get(uncache_url)
  end

  def cache_http_get(headers={})
    resuorce = RestClient::Resource.new(cache_url, timeout: 15, open_timeout: 15)
    JSON.parse(resuorce.get(:params => headers))
  end

  def uncache_http_get(url, headers={})
    resuorce = RestClient::Resource.new(uncache_url, timeout: 15, open_timeout: 15)
    JSON.parse(resuorce.get(:params => headers))
  end

  def cache_url()
    url = "http://localhost:8080/configfiles/json/#{@app_id}/#{cluster_name}/#{name_space}"
    url
  end

  def uncache_url(releaseKey = "")
    url = "http://localhost:8080/configs/#{@app_id}/#{cluster_name}/#{name_space}?releaseKey=#{releaseKey}"
    url
  end
end