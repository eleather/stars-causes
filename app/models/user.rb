class User < ActiveRecord::Base
  acts_as_authentic

  has_and_belongs_to_many :stars

  has_many :stars_given, :class_name => 'Star', :foreign_key => :from_id
  
  attr_accessible :name, :email, :password, :password_confirmation, :facebook_uid, :active

  ###
  # Named Scopes
  ###

  def self.active
    return User.where(:active => true)
  end
  
  def self.inactive
    return User.where(:active => false)
  end
  
  ###
  # Instance Methods
  ###

  def can_second?(star)
    return false if [star.from, star.to].flatten.include?(self)
    return false if seconded?(star)
    true
  end

  def most_recent_star
    stars.recent.first
  end

  def others
    User.active.all - [self]
  end

  def second(star)
    star.seconds.create(:user => self) if can_second?(star)
  end

  def seconded?(star)
    star.seconded_by?(self)
  end
end
