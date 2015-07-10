class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  has_many :user_roles
  has_many :restaurants, through: :user_roles


  before_save   { self.email = email.downcase }
  before_create :create_remember_token

  validates :full_name,
            presence: true,
            length:   { maximum: 50 }

  validates :role,
            presence: true

  validates :email,
            presence:   true,
            length:     { maximum: 50 },
            format:     { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: true }

  validates :password,
            presence:     true,
            length:       { in: 6..40 },
            confirmation: true

# why are tokens not defined in session/user controller or session/user helper?

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
end
