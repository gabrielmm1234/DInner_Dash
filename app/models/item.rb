class Item < ActiveRecord::Base
	has_many :order_items
	has_and_belongs_to_many :category
	validates_presence_of :Name, :Description, :Price
	accepts_nested_attributes_for :category, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

	default_scope { where(active: true) }
end
