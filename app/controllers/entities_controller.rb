class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[new create]
  before_action :set_entity, only: %i[show edit update destroy]

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.author_id = current_user.id

    respond_to do |format|
      if @entity.save
        format.html { redirect_to group_path(@group), notice: 'Entity was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount, group_ids: [])
  end
end
