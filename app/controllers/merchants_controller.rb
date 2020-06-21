class MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show, :edit, :update, :destroy]

	def index
    @merchants = Merchant.all
  end

	def new
		@merchant = Merchant.new
	end

	def create
		@merchant = Merchant.new(merchant_params)

		if @merchant.save
			redirect_to @merchant, notice: 'The merchant was created successfully'
		else
			render :new
		end
	end

	def show
	end

  def edit
  end

  def update
    if @merchant.update(merchant_params)
      redirect_to @merchant, notice: 'The merchant was updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @merchant.delete
    redirect_to merchants_path, notice: 'The merchant was deleted successfully'
  end

	private

	  def merchant_params
	  	params.require(:merchant).permit(:company, :production_parent_mid, :sandbox_parent_mid, :company_nickname, :main_contact, :main_contact_email, :franchise_or_smb, :has_global_db, :has_memberships, :has_migration, :has_dedicated_infrastructure, :has_enterprise_billing, :notes, :rollout_planner_link, :project_plan_link, :drive_folder_link, :training, :timezone)
	  end

	  def set_merchant
	  	@merchant = Merchant.find(params[:id])
	  end
end
