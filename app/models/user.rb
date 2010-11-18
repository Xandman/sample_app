# == Schema Information
# Schema version: 20101118162841
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  
  email_regex = /\A[\w+.\-]+@[a-z\d\-]+\.[a-z.]+\z/i
  
  validates :name,     :presence   => true,
                       :length     =>  {:maximum => 50}
  validates :email,    :presence   => true, 
                       :format     => {:with => email_regex},
                       :uniqueness => { :case_sensitive => false } 
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => {:within => 6..40}
  
  before_save :encrypt_password
  
  #Return true if the user's password matches the submitted password.
  def has_password?(submitted_password)
    #compare encrypted_password with the encrypted version of
    #submitted_password
    encrypted_password == encrypt(submitted_password)
  end
  
  private
    def encrypt_password
      self.encrypted_password = encrypt(password)
    end
    
    def encrypt(string)
      string #only a temp implementation!
    end
end
