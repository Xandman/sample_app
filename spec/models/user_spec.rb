require 'spec_helper'

describe User do
  
  before( :each) do
    @attr = { :name => "Example User", :email => "user@example.com"}
  end
  
  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end
  
  it "should require a name" do
    no_name_user = User.new( @attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  
  it "should require email" do
    no_email_user = User.new( @attr.merge(:email =>""))
    no_email_user.should_not be_valid
  end  
 
  it "names should not be too long" do
    long_name = "a" *51
    long_name_user = User.new(@attr.merge( :name => long_name))
    long_name_user.should_not be_valid
  end
  
  it "should accept valid emails" do
    addresses = %w[user@foo.com the_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge( :email => address))
      valid_email_user.should be_valid
    end
  end
    
  it "should reject invalid emails" do
    addresses = %w[user@foo,com the_USER_foo.bar.org first.last@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge( :email => address))
      invalid_email_user.should_not be_valid
    end
  end
  
  it "email should be unique" do
    User.create!(@attr)
    user_with_duplicate = User.new(@attr)
    user_with_duplicate.should_not be_valid
    
  end
  
  it "email should be unique up to case" do
        upcased_email = @attr[:email].upcase
        User.create!(@attr.merge(:email => upcased_email))
        user_with_duplicate = User.new(@attr)
        user_with_duplicate.should_not be_valid
      end
  
end
