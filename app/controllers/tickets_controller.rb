# coding : utf-8

class TicketsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_mandatory_field
  # GET /tickets
  # GET /tickets.json
  def index
    
    if (params[:all]=='true' && current_user.admin?)
      @tickets = Ticket.all
    
    elsif (params[:matched] == 'true')
      @tickets = current_user.tickets.where(:status => 'matched')
      
    else
       @tickets = current_user.tickets
    end
   

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tickets }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.json
  def new
    @ticket = Ticket.new
    
    3.times { @ticket.relationship_ticket_schedules.build }
    
    if params[:concert_id]
    @concert = Concert.find(params[:concert_id])
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
    @concert = @ticket.concert
    @s_schedules = @ticket.select_schedules
   #     if params[:concert_id]
   # @concert = Concert.find(params[:concert_id])
   # end
  end

  # POST /tickets
  # POST /tickets.json
  def create
    #@ticket = Ticket.new(params[:ticket])
      @ticket = current_user.tickets.build(params[:ticket])
    
    
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render json: @ticket, status: :created, location: @ticket }
      else
        format.html { render action: "new" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
    
       
  end

  # PUT /tickets/1
  # PUT /tickets/1.json
  def update
    @ticket = Ticket.find(params[:id])
    @concert = @ticket.concert
    @s_schedules = @ticket.select_schedules
    
    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end
  
private
  def check_mandatory_field
      if current_user.phone.blank? or current_user.gender.blank? or current_user.name.blank? or current_user.email.blank? or current_user.tribe.blank?
        redirect_to edit_user_registration_path, notice: "신청을 하시려면 필수 항목정보를 모두 입력해야합니다."
      end   
      
      
       
  end
end
