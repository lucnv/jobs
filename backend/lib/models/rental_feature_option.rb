class RentalFeatureOption < BaseRecord
  belongs_to :rental

  field :id
  field :rental_id
  field :type
end
