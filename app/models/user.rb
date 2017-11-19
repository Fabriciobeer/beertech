class User < ActiveRecord::Base
    belongs_to :cliente
    before_save { self.email = email.downcase }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
    validates :cliente_id, presence: true
    validate :password_canot_be_password

    def password_canot_be_password
        errors.add(:password_digest, "senha não pode ser password") if password_digest == "password"
    end
    has_secure_password
    
    
end
