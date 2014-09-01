class Supplier < ActiveRecord::Base
#  attr_accessible :address, :location_id, :name, :user_id

  belongs_to :location
  belongs_to :user
  has_many :articles 


end
