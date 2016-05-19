class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    render json: {params: params, user_params: user_params, user_params2: user_params2}
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit({
                                   reference_ids: []
                                 })
  end

  def user_params2
    _params = params.require(:user)
    _params[:reference_ids] = _params[:reference_ids].map { |id| BSON::ObjectId(id) }
    _params.permit(reference_ids: [])
  end
end
