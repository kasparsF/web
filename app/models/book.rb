class Book < ActiveRecord::Base
has_and_belongs_to_many :authors
belongs_to :publisher

has_many :cart_items
has_many :carts, :through => :cart_items

	has_attached_file :cover_image, :styles => { :medium => "400x400>", :thumb => "100x100>" },
        :default_style => :medium,
		:default_url => "/images/:style/missing.png"
	validates_attachment_content_type :cover_image,
	:content_type => /\Aimage\/.*\Z/,
	:default_style => :medium
	

validates_length_of :title, :in => 1..255, :message => "lauks ir tukšs vai pārāk garš(1-255)!"
validates :publisher, :presence => {:message => "lauks ir tukšs!"}
validates :authors, :presence => {:message => "lauks ir tukšs!"}
validates :published_at, :presence => {:message => "lauks ir tukšs!"}
validates_numericality_of :page_count, :only_integer => true, :message => "lauks ir tukšs vai pārāk garš(1-255)!"
validates_numericality_of :price, :message => "laukā netika ievadīts skaitlis!"
validates_format_of :isbn, :with => /[0-9\-xX]{13}/, :message => "ir nepareizi sastādīts!"
validates_uniqueness_of :isbn, :message => "lauka vērtība jau eksistē!"
# roughly speaking sets list of model protected attributes to []
# making all attributes accessible while mass-assignment
attr_protected

def self.latest
last(10)
end

end