class Location
	include Mongoid::Document
	include Geocoder::Model::Mongoid

	belongs_to :trip
	belongs_to :user

	field :coordinates, type:Array
	field :address
	field :description

	geocoded_by :address 
	after_validation :geocode
end