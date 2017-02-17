class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :picture
  acts_as_votable
end
