class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    inertia('Users/Index', users: User.all.map { |u| { id: u.id, name: u.name } })
  end

  def show
    user = User.find(params[:id])

    inertia('Users/Show', user: user)
  end

  def new
    inertia('Users/New')
  end

  def create
    User.create(user_params)

    redirect_to users_path, status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :age, :gender)
  end
end
