class Admin::OfficersController < AdminController

  def index
	@mcc_officers = Officer.order("created_at asc").where(undergrad: true)
    @mice_officers = Officer.order("created_at asc").where(undergrad: false)
  end

  def edit
  	@officer = Officer.find params[:id]
  end

  def update
  	@officer = Officer.find params[:id]
    if @officer.update_attributes(params[:officer])
    	flash[:success] = "Officer successfully updated."
    else
    	flash[:danger] = "Something went wrong!"
    end
    redirect_to admin_officers_path
  end

  def new
  	@officer = Officer.new
  end

  def create
  	@officer = Officer.new params[:officer]
  	if @officer.valid?
  		@officer.save!
  		flash[:success] = "Officer successfully created."
  	else
  		flash[:danger] = "Something went wrong! Officer was not created."
  	end
  	redirect_to admin_officers_path
  end

  def destroy
  	@officer = Officer.find params[:id]
  	@officer.destroy!
  	flash[:success] = "Officer deleted."
  	redirect_to admin_officers_path
  end

end
