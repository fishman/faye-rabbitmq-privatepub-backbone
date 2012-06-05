class HomeController < ApplicationController
  def index
  end
  def send_message
    PrivatePub.publish_to("/messages/new", "alert('hello');")

    head :ok
  end
end
