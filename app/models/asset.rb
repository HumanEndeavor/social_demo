class Asset < ActiveRecord::Base
  belongs_to  :user
has_attached_file  :asset, :styles => {  :large => "800*600>",  :medium => "150*150>",  :thumb => "150*150>" }

end
