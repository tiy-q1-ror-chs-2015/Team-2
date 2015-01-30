class UsersController < ApplicationController
  # user index
  def index
    @users = User.all
  end
end
