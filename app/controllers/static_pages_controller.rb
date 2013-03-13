class StaticPagesController < ApplicationController
  def home
  	@title_page = "Leave Tools"
  end

  def about
  	@title_page = "About"
  end

  def help
  	@title_page = "Help"
  end

  def contact
  	@title_page = "Contact"
  end
end
