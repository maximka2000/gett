class WelcomeController < ApplicationController
  def index
      @drivers = Driver.all
      @metrics = Metric.all
  end
end
