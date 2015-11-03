class SkillsController < ApplicationController
  load_and_authorize_resource

  def create
    if @skill.save
      render json: @skill.to_json(Skill.compact_json), status: :ok
    else
      render json: @skill.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @skill.update(skill_params)
      render json: @skill.to_json(Skill.compact_json), status: :ok
    else
      render json: @skill.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    if @skill.destroy
      render json: {response: 'ok'}.to_json, status: :ok
    else
      render json: @skill.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    def skill_params
      params.require(:skill).permit(:name, :description, :hero_id, :img_url, :lock_version, :created_at, :updated_at)
    end
end
