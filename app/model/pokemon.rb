class Pokemon < ActiveRecord::Base
  validates :name, presence: true
  validates :ability, presence: true
  validates :poketype, presence: true
end
