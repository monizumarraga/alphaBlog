class Message 
    include ActiveModel::Model
    attr_accessor :name, :email, :content, :to
    validates :name, :email, :content, :to, presence: true
end
