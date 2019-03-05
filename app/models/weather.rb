class Weather
	include Mongoid::Document
	include Mongoid::Timestamps

	field :city, type: String
    field :temperature, type: Float
    field :discrete_temperature, type: Integer

	index({ city: 1, created_at: -1 }, { unique: true})
    index({ city: 1, discrete_temperature: -1 })
	
end