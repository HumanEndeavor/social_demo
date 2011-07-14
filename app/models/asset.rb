class Asset < ActiveRecord::Base
  belongs_to  :user
  has_attached_file  :asset, :styles => {  :large => "800*600>",  :medium => "250*150>",  :thumb => "50*50>"}
  validates_attachment_presence :asset
  validates_attachment_size :asset, :less_than => 10.megabytes
  validates_attachment_content_type :asset, :content_type => ['image/jpeg',
    'image/png',
    'image/gif']
  validate :prohibited_ext


  protected

  def prohibited_ext
    if !self.asset.nil? and self.asset.original_filename
      if self.asset.original_filename.match(/^.*\.(exe|bat|ceo|pif|scr|js|ws|cpl|hta|rar|vbs|bhx|hqx|mim|com|uu|uue|xxe|ini|pl)$/)
        errors.add(:asset, "File Format is not Supported.")
      end
    end
  end
end
