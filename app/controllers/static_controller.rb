class StaticController < ApplicationController
  def home
    @dog = Dog.featured
  end
end
