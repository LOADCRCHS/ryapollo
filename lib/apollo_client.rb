class ApolloClient

  def get_value
    
  end

  def http_get(url, headers={})
    resuorce = RestClient::Resource.new(url, timeout: 15, open_timeout: 15)
    load_json(resuorce.get(:params => headers))
  end
end