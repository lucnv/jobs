class Rental < BaseRecord
  belongs_to :car
  has_many :rental_feature_options

  field :id
  field :car_id
  field :start_date
  field :end_date
  field :distance

  def feature_options
    FeatureOption.where type: rental_feature_options.map(&:type)
  end
end
