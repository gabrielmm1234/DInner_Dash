class Item < ActiveRecord::Base
	has_many :order_items
	has_and_belongs_to_many :categories
	has_many :order_items
	validates_presence_of :Name, :Description, :Price
	accepts_nested_attributes_for :categories, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	mount_uploader :image, ImageUploader
end
