class Article < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
end
