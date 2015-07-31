class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index

    @q = Company.search(params[:q])
    @companies = @q.result

    #@companies = Company.all

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
  f.title(:text => "Total number of companies registered")
  f.xAxis(:categories => ["Company statistic"])
  f.series(:name => "Number of companies", :yAxis => 0, :data => [Company.count()])
  
  f.series(:name => "Number of employees", :yAxis => 0, :data => [Employee.count()])
  f.yAxis [
    {:title => {:text => "Hello", :margin => 70} },
    {:title => {:text => "Companies in numbers"}, :opposite => true},
  ]

  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
  f.chart({:defaultSeriesType=>"column"})
end
    
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def import
     Company.import(params[:file])
     redirect_to companies_path, notice: "Companies added successfully"
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :manager, :status, :terms)
    end
end
