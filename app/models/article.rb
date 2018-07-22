class Article < ActiveRecord::Base
    belongs_to :user
    has_many :article_categories
    has_many :categories, through: :article_categories
    validates :title, presence: true, length: {minimum: 3, maximum: 50}
    validates :description, length: {maximum: 1000}
    validates :user_id, presence: true
    
    
  def self.search(param)
    if param
      param.strip!
      param.downcase!
      to_send_back=(title_matches(param) + description_matches(param)).uniq
      return nil unless to_send_back
    else 
      to_send_back=Article.all
      
    end
    to_send_back
  end
  
  def self.title_matches(param)
    matches('title', param)
  end
  
  def self.description_matches(param)
    matches('description', param)
  end
  
  def self.matches (field_name, param)
    Article.where("#{field_name} like ?", "%#{param}%")
  end
end