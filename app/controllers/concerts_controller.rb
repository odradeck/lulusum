class ConcertsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_filter, except: [:index]
  # GET /concerts
  # GET /concerts.json
  def index
    if params[:filter] == 'all'
    @concerts = Concert.all
    elsif params[:filter] == 'finished'
      @concerts = Concert.where(:status => 'finished')
    elsif params[:filter] == 'ready'
      @concerts = Concert.where(:status => 'ready')
    else
      @concerts = Concert.where(:status => 'active')
    end
      
      

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @concerts }
    end
  end

  # GET /concerts/1
  # GET /concerts/1.json
  def show
    @concert = Concert.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @concert }
    end
  end

  # GET /concerts/new
  # GET /concerts/new.json
  def new
    @concert = Concert.new
    
    1.times { @concert.schedules.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @concert }
    end
  end

  # GET /concerts/1/edit
  def edit
    @concert = Concert.find(params[:id])
    
  end

  # POST /concerts
  # POST /concerts.json
  def create
    @concert = Concert.new(params[:concert])

    respond_to do |format|
      if @concert.save
        format.html { redirect_to @concert, notice: 'Concert was successfully created.' }
        format.json { render json: @concert, status: :created, location: @concert }
      else
        format.html { render action: "new" }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /concerts/1
  # PUT /concerts/1.json
  def update
    @concert = Concert.find(params[:id])

    respond_to do |format|
      if @concert.update_attributes(params[:concert])
        format.html { redirect_to @concert, notice: 'Concert was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concerts/1
  # DELETE /concerts/1.json
  def destroy
    @concert = Concert.find(params[:id])
    @concert.destroy

    respond_to do |format|
      format.html { redirect_to concerts_url }
      format.json { head :no_content }
    end
  end
end
