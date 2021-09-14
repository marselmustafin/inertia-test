class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    inertia('Users/Index', users: User.all.map { |u| { id: u.id, name: u.name, email: u.email } })
  end

  def show
    user = User.find(params[:id])

    inertia('Users/Show', user: user)
  end

  def new
    inertia('Users/New')
  end

  def create
    user = User.create(user_params)

    if user.persisted?
      redirect_to users_path, status: :see_other
    else
      redirect_to new_user_path, inertia: { errors: user.errors }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :age, :gender)
  end
end
