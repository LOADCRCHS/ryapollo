class ApolloClient

  def initialize(app_id="", cluster_name = "default", name_space = "appilication")
    @app_id = app_id
    @cluster_name = cluster_name
    @name_space = name_space
  end

  # 每次从服务器读取最新的配置(无缓存接口,直接从数据库中获取配置)
  def newest_value(key)
    newest_config_map(key)
  end

  # 每次从服务器读取最新的配置(带缓存接口)
  def value(key)
    config_map(key)
  end

  def start_long_polling

  end

  def newest_config_map
    http_get(uncache_url)
  end

  def config_map
    http_get(cache_url)
  end

  def parse_json(str)
    result = JSON.parse(str)
    configurations = result.delete()
  end

  def http_get(url)
    resuorce = RestClient::Resource.new(url, timeout: 15, open_timeout: 15)
  end

  def cache_url()
    url = "http://localhost:8080/configfiles/json/#{@app_id}/#{cluster_name}/#{name_space}"
    url
  end

  def uncache_url(releaseKey = "")
    url = "http://localhost:8080/configs/#{@app_id}/#{cluster_name}/#{name_space}?releaseKey=#{releaseKey}"
    url
  end

  def last_config
    #todo 从缓存文件里读取上次获取的配置
    result = {
                "appId": "100004458",
                "cluster": "default",
                "namespaceName": "application",
                "configurations": {
                  "portal.elastic.document.type":"biz",
                  "portal.elastic.cluster.name":"hermes-es-fws"
                },
                "releaseKey": "20170430092936-dee2d58e74515ff3"
              }
  end

  def save_config(result)
    #todo 将获取到的配置存到本地
    
  end

  def release_key
    last_config["release_key"]
  end
end