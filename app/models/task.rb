class Task < ApplicationRecord
  belongs_to :tasklist

  validates_presence_of :name
end
