class Signup < ApplicationRecord
  belongs_to :camper
  belongs_to :activity

  # validates :time, numericality: {in: 0..23}


  validates :time, inclusion: {in: 0..23}, numercality: true


end
