class Category < ActiveRecord::Base
	has_and_belongs_to_many :items, :join_table => 'categories_items'
end
