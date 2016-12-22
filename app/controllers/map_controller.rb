class MapController < ApplicationController
  def index
      if (params[:type]=='driver')
            @metrics=MetricDetail.where('driver_id=?', params[:id])
      else
            @metrics=MetricDetail.where('metric_id=?', params[:id])
      end
  end
end
