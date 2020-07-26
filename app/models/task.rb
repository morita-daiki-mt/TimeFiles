class Task < ApplicationRecord
  belomgs_to :user
  has_many :histories
end
