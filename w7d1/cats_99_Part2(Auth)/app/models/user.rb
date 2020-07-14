class User < ApplicationRecord
    validates :user_name, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: {minimum: 6, allow_nil: true }
    after_initialize :ensure_session_token #we still need to create the ensure_session_token method 
    #before_validation :ensure_session_token #initialize(.new) => after_initiliaze => save instance to database(.save) => before_validation => validates

    attr_reader :password

    def self.find_by_credentials(user_name, password)
        user = User.find_by(user_name: user_name)
        if user && user.check_password?(password)
            user
        else
            nil
        end
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end 

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
    
    def check_password?(password) #instructions called this is_password?
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(password)
    end
    
end
