class FeatureOption < BaseRecord
  self.data = [
    { id: 1, type: "gps", fee: 500, actor: :owner },
    { id: 2, type: "baby_seat", fee: 200, actor: :owner },
    { id: 3, type: "additional_insurance", fee: 1000, actor: :drivy }
  ]

  class << self
    def by_actor actor
      where actor: actor
    end
  end
end
