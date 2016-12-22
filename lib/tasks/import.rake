namespace :import do

  desc "delete drivers and metrics"
  task :clear => :environment do
     puts "clear started"  
     Driver.destroy_all
     Metric.destroy_all
     puts "clear finished"  
  end
          
  desc "import drivers from json"
  task :drivers => :clear do
    puts "drivers started"  
    count = 0
    file = File.read('C:/Ruby23-x64/bin/gett/files/drivers.json')
    arrDrivers = JSON.parse file
    arrDrivers.each do |driver|
      Driver.create! driver    
      count = count + 1
    end                   
    puts count.to_s + " drivers inserted"  
  end

  desc "import metrics from json"
  task :metrics => :drivers do 
    puts "metrics started "  + Time.new.to_s
    file = File.open('C:/Ruby23-x64/bin/gett/files/metrics.json')
    drivers = Hash.new
    metrics = Hash.new
    count = 0
    skipped = 0
    puts "metrics loop started"
    file.each do |line|
      metric_detail = JSON.parse line
      driver_id=metric_detail['driver_id']
      
      #we want to minimize db access, so we have a in mem cache of drivers
      if (!drivers.key?(driver_id))
         drivers[driver_id]=Driver.exists?(driver_id);
      end
      
      # we want to skip metrics if they belong to non existing drivers
      if (drivers[driver_id])
      
         metric_name=metric_detail['metric_name']
         if (!metrics.key?(metric_name))
            metric = Hash.new
            metric['name']=metric_name
            Metric.create! metric
            #once the metric created we want to cache its id 
            metrics[metric_name]=Metric.where('name=?', metric_name).first.id
         end
         
         metric_detail['metric_id']=metrics[metric_name]         
         metric_detail.delete('metric_name')
         MetricDetail.create! metric_detail
         count = count + 1
      else
         skipped = skipped + 1 
      end
    end                   
    puts count.to_s + " metrics inserted (" + skipped.to_s + " skipped) "  + Time.new.to_s
  end
  
  desc "import all"
  task :all => :metrics
end