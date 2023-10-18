class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[ new create ]
  before_action :set_entity, only: %i[ show edit update destroy ]

  # GET /entities/new
  def new
    @entity = Entity.new
    @group = Group.find(params[:group_id])
  end

  # POST /entities or /entities.json
  def create
    @entity = Entity.new(entity_params)
    @entity.groups << @group
    @entity.author_id = current_user.id

    respond_to do |format|
      if @entity.save
        format.html { redirect_to group_path(@group), notice: "Entity was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      @entity = Entity.find(params[:id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

    # Only allow a list of trusted parameters through.
    def entity_params
      params.require(:entity).permit(:name, :amount)
    end
end
