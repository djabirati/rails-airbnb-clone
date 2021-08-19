class Meal < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attributes :title, :category, :description
  end

  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
