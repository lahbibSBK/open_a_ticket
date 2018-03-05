class MentorProfilsController < ApplicationController
  before_action :set_mentor_profil, only: [:show, :edit, :update, :destroy]

  def index
    @mentor_profils = MentorProfil.all
    authorize @mentor_profils
  end

  def new
    @mentor_profil = MentorProfil.new
    authorize @mentor_profil
  end

  def create
    @mentor_profil = MentorProfil.new(mentor_profil_params)
    @mentor_profil.user = current_user
    tag = params[:mentor_profil][:mentor_skills]
    tag.shift
    @mentor_profil.tag_names = tag
    authorize @mentor_profil
    if @mentor_profil.save
      redirect_to mentor_profil_path(@mentor_profil)
    else
      render :new
    end
  end

  def update
    authorize @mentor_profil
    if @mentor_profil.update(mentor_profil_params)
      redirect_to mentor_profil_path(@mentor_profil)
    else
      render :edit
    end
  end

  def destroy
    authorize @mentor_profil
    @mentor_profil.destroy
    redirect_to mentor_profils_path
  end

  def show
    # authorize @mentor_profil
    @reviews = @mentor_profil.user.reviews
  end

  def edit
  end

  private

  def set_mentor_profil
    @mentor_profil = MentorProfil.where(user_id: params[:id])
    authorize @mentor_profil
  end

  def mentor_profil_params
    params.require(:mentor_profil).permit(:experience, :minimum_price, :user_id)
  end
end
