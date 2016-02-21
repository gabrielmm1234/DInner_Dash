class Item < ActiveRecord::Base
	has_and_belongs_to_many :category
	validates_presence_of :Name, :Description, :Price
end
