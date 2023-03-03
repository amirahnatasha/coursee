class Course < ApplicationRecord
    mount_uploader :imageLink, AvatarUploader
end
