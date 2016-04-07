namespace :grape do
  desc "TODO"
  task routes: :environment do
    PositionSystems::V1::Root.routes.each do |route|
      path = route.route_path
      path.sub!("(.:format)",".json")
      path.sub!("/:version","")
      r = {
          method: route.route_method,
          path: path,
          params: route.route_params,
          desc: route.route_description
      }
      puts r.map{|k,v| "#{k}:#{v}"}.join('  ')
    end
  end
end