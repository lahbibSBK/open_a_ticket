class SkillsController < ApplicationController
  before_action :set_tag, only: [:new, :create]
  before_action :set_skill, only: [:edit, :update, :destroy]

  def edit
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = @tag.skills.create!(skill_params)
    redirect_to tag_path(@tag)
  end

  def update
    @skill.update(skill_params)
    redirect_to tag_path(@skill.tag_id)
  end

  def destroy
  end

  private

  def skill_params
    params.require(:skill).permit(:name)
  end

  def set_tag
    @tag = Tag.find(params[:tag_id])
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end
end




