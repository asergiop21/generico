class Location < ActiveRecord::Base
#  attr_accessible :country, :departament, :name, :province, :zipcode

  has_many :supplier
  has_many :customer

  PROVINCE = ['BUENOS AIRES', 'CATAMARCA', 'CHACO', 'CHUBUT', 'CORDOBA', 'CORRIENTES', 'ENTRE RIOS', 'FORMOSA', 'JUJUY', 'LA PAMPA', 'LA RIOJA', 'MENDOZA', 'MISIONES', 'NEUQUEN', 'RIO NEGRO', 'SALTA', 'SAN JUAN', 'SAN LUIS', 'SANTA CRUZ', 'SANTA FE', 'SANTIAGO DEL ESTERO', 'TIERRA DEL FUEGO', 'TUCUMAN' ] 

  validates :name,   presence: true
  validates :name, :departament, length: {maximum: 200} 
  validates :zipcode, length: {maximum: 5} 
  validates :name, uniqueness: {scope: :departament}

end
