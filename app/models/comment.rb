class Comment < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :star
  
  validates_presence_of :author, :body, :star
  
  attr_accessible :star_id, :author_id
  
  after_create do |comment|
    Mailer.deliver_comment(comment)
  end
end
