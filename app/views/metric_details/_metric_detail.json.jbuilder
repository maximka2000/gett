json.extract! metric_detail, :id, :metric_id, :value, :lon, :timestamp, :lat, :driver_id, :created_at, :updated_at
json.url metric_detail_url(metric_detail, format: :json)