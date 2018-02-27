class MentorProfilsController < ApplicationController
  before_action :set_mentor_profil, only: [:show, :edit, :update, :destroy]

  def index
    @mentor_profils = Mentor_profil.all
  end

  def new
    @mentor_profil = Mentor_profil.new
  end

  def create
    @mentor_profil = Mentor_profil.new(mentor_profil_params)
    if @mentor_profil.save
      redirect_to mentor_profil_path(@mentor_profil)
    else
      render :new
    end
  end

  def update
    if @mentor_profil.update(mentor_profil_params)
      redirect_to mentor_profil_path(@mentor_profil)
    else
      render :edit
    end
  end

  def destroy
    @mentor_profil.destroy
    redirect_to mentor_profils_path
  end

  def show
  end

  def edit
  end

  private

  def set_mentor_profil
    @mentor_profil = Mentor_profil.find(params[:id])
  end

  def mentor_profil_params
    params.require(:mentor_profil).permit(:experience, :minimum_price, :user_id)
  end
end
