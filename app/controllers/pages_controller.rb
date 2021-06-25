class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @brands = Brand.all
    @brands_sample = @brands.sample(5)
  end
end
