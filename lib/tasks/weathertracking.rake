namespace :weathertracking do
	
  	task :discover => :environment do
        require 'net/http'
        url = URI.parse('http://api.openweathermap.org/data/2.5/weather?q=Buenos Aires&APPID=2efc985a48a9194083129e39b34e1cc7')
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
        }
        j = JSON.parse(res.body, symbolize_names: true)
        n = j[:main][:temp]-273.15

        t = Weather.new(city: 'Buenos Aires', temperature: n, discrete_temperature: n.round)
        t.save
        puts t.to_json
	end
end