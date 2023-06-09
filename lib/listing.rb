require_relative './user'
require 'active_record'
require_relative './database_connection'

DatabaseConnection.establish_database_connection

class Listing < ActiveRecord::Base
  belongs_to :user
  
    @listings = []

  def self.all_listings
    Listing.joins(:user).map do |listing|
      @listings << "#{listing.user.name} #{listing.listing_name} #{listing.available_from} #{listing.available_to} #{listing.price_per_night} #{listing.description} #{listing.location}"
    end
    @listings
  end

  def self.create_listing(listing_name, available_from, available_to, price_per_night, description, location, user_id)
    listing = Listing.new(listing_name: listing_name, available_from: available_from, available_to: available_to, price_per_night: price_per_night, description: description, location: location, user_id: user_id)
    listing.save
    listing
  end
  
end