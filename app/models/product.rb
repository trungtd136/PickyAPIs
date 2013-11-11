class Product < ActiveRecord::Base
  has_attached_file :image, :styles => { :normal => "100"}, :default_style => :normal
  # validates_attachment_presence :icon
  # validates_attachment_size :icon, :less_than => 5.megabytes
  # validates_attachment_content_type :icon, :content_type => ['image/jpeg', 'image/png']
end