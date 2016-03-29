class Dispatch < Grape::API
  mount V1::Root

  format :json
  content_type :json, 'application/json;charset=utf-8'


  route :any, '*path' do
    status 404
    { error: 'Page not found.' }
  end

end