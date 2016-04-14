class WelcomeController < ApplicationController

  # this defines an 'acton' called index for the 'WelcomeController'
  def index
    #render text: "Hello world!"

    # by default (convention) Rails will render:
    # views/welcome/index.html.erb (when receiving a request that has an HTML format)
    # render :index
    # or
    # render "/some_other_folder/some_other_action"
    # but the render :index is done automatically
  end

  def about
    render :about
  end
end
