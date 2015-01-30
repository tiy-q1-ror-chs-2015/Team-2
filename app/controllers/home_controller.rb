class HomeController < ApplicationController

  def index
    # if the user is logged in, redirect to the current user page,
    # otherwise render our marketing page
    if user_signed_in?
      @informative_text = "#{current_user.email} is signed in"
    else
      @informative_text = 'No user is singed in'
    end
  end

end
