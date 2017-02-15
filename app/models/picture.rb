class Picture < ApplicationRecord
  has_many :tags
  has_many :users, :through => :tags
  # before_save :set_owner

  # def set_owner
  #   self.owner_id = current_user.id
  # end
end
