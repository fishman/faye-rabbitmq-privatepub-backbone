class ParticipantsController < ApplicationController
  respond_to :xml, :json 

  def index
    respond_with(@participants = Participant.all)
  end

  def destroy
    head :ok
  end

end
