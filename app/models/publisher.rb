class Publisher < ActiveRecord::Base
has_many :books
validates_length_of :name, :in => 2..255, :message => "lauks ir tukšs vai pārāk garš(2-255)!"
validates_uniqueness_of :name, :message => "ar šādu vērtību eksistē!"
attr_accessible :name
end