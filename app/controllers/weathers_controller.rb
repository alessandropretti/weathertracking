class WeathersController < ApplicationController
    def current
        require 'net/http'
        url = URI.parse('http://api.openweathermap.org/data/2.5/weather?q=Buenos Aires&APPID=2efc985a48a9194083129e39b34e1cc7')
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
        }
        j = JSON.parse(res.body, symbolize_names: true)
        @t = j[:main][:temp]-273.15
    end
end