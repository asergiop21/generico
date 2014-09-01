class Model < ActiveRecord::Base
#  attr_accessible :comment, :make_id, :name, :category_id

#relacion
 belongs_to  :make
 belongs_to  :category
 has_many :equipment

#Validates
  validates :name, :category_id , :presence => {:mesaje => 'Debe complpetar los campos'} 

end
