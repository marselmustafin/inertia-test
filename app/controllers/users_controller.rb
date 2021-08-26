class UsersController < ApplicationController
  def index
    inertia('Users/Index', users: User.all.map { |u| { id: u.id, name: u.name } })
  end

  def show
    user = User.find(params[:id])

    require 'pry'; binding.pry
    inertia('Users/Show', user: user)
  end
end
