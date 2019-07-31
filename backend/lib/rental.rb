class Rental < ActiveHash::Base
  include ActiveHash::Associations

  belongs_to :car

  field :id
  field :car_id
  field :start_date
  field :end_date
  field :distance
end
