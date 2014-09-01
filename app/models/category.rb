class Category < ActiveRecord::Base
#  attr_accessible :comment, :name

  #Relacion
  has_many :model
  has_many :articles
end
