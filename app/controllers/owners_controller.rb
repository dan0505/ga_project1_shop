class OwnersController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  def index
  end
end
