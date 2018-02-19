class Tasklist < ApplicationRecord
  belongs_to :board
  has_many :tasks

  validates_presence_of :name
end
