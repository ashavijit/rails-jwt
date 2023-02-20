class User < ApplicationRecord
    has_secure_password
    mount_uploader :avatar, AvatarUploader
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 6 }, if:-> { new_record? || !password.nil? }

end
                                                                                    
    # validates :password_confirmation, presence: true, length: { minimum: 6 }