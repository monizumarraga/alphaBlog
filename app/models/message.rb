class Message 
    include ActiveModel::Model
    attr_accessor :name, :email, :body, :to
    validates :name, :email, :body, :to, presence: true
end
