class Board < ApplicationRecord
  has_many :tasklists

  validates_presence_of :name
  validates_uniqueness_of :name
end
