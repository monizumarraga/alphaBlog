class Message 
    include ActiveModel::Model
    attr_accessor :name, :email, :body, :to, :from
    validates :name, :email, :body, :to, :from, presence: true
end
