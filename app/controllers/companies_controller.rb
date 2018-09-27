class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find params[:id]
  end

  def new
    @company = Company.new
    @company.name = "ALGUMA COISA"
  end

  def create
    permitted_params = params.require(:company).permit(:name, :active)

    @company = Company.new(permitted_params)
    if @company.save
      redirect_to @company
    else
      render :new
    end
  end

  def edit
    @company = Company.find params[:id]
  end

  def update
    permitted_params = params.require(:company).permit(:name, :active)

    if @company.update(permitted_params)
      redirect_to @company
    else
      render :edit
    end
  end
end
