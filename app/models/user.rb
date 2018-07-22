class User < ActiveRecord::Base
    has_many :articles, dependent: :destroy
    has_one :detail, dependent: :destroy
    before_save {self.email= email.downcase}
    validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 105}, format: {with: VALID_EMAIL_REGEX}
    has_secure_password
    
  def self.search(param)
    if param
      param.strip!
      param.downcase!
      to_send_back=(name_matches(param) + email_matches(param)).uniq
      return nil unless to_send_back
      
    else 
      to_send_back=User.all
      
    end
    to_send_back
  end
  
  def self.name_matches(param)
    matches('username', param)
  end
  
  def self.email_matches(param)
    matches('email', param)
  end
  
  def self.matches (field_name, param)
    User.where("#{field_name} like ?", "%#{param}%")
  end
  
end