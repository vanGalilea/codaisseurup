class PagesController < ApplicationController
  def home
    @themes = Theme.all
  end

  def about
  end

  def terms
  end
end
