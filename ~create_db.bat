rails generate scaffold Driver driver_id:integer name:string license_number:string --force
rails generate scaffold Metric name:string --force
rails generate scaffold MetricDetail metric_id:string value:string lon:float timestamp:decimal lat:float driver_id:string --force
rails db:migrate RAILS_ENV=development
bundle exec rake db:migrate
rake import:all
