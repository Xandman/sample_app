class PagesController < ApplicationController
  # @base_title = "Ruby on Rails Tutorial"
  
  def home
    @base_title = "Ruby on Rails Tutorial"
    @title = "Home"
  end

  def contact
    @base_title = "Ruby on Rails Tutorial"
    @title = "Contact"
  end

  def about
    @base_title = "Ruby on Rails Tutorial"
    @title = "About"
  end
  
  def help
    @base_title = "Ruby on Rails Tutorial"
    @title = "Help"
  end

end
