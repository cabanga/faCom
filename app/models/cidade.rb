class Cidade < ApplicationRecord
	has_many :empresa
	has_many :registos
end
