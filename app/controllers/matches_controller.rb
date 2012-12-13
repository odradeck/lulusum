# coding : utf-8

class MatchesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_filter, except: [:show]
  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matches }
    end
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    @match = Match.find(params[:id])
    
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/new
  # GET /matches/new.json
  def new
    @match = Match.new
    
    @boy_tickets = Ticket.joins(:user).where('users.gender' => '남자', :status => nil)
    @girl_tickets = Ticket.joins(:user).where('users.gender' => '여자', :status => nil)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/1/edit
  def edit
    @match = Match.find(params[:id])
    @boy_tickets = Ticket.joins(:user).where('users.gender' => '남자', :status => nil)
    @girl_tickets = Ticket.joins(:user).where('users.gender' => '여자', :status => nil)
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(params[:match])
    @ticket_ids = params[:ticket_ids]

    respond_to do |format|
      if @match.save
        
        @ticket_ids.each do |t_id|
          ticket = Ticket.find(t_id)
          ticket.match = @match
          ticket.status = 'matched' 
          ticket.save
        end 
        
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render json: @match, status: :created, location: @match }
      else
        format.html { render action: "new" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /matches/1
  # PUT /matches/1.json
  def update
    @match = Match.find(params[:id])
    @ticket_ids = params[:ticket_ids]
     
     
    @match.tickets.each do |tticket|
          tticket.match_id = nil
          tticket.status = nil 
          tticket.save
    end 

    respond_to do |format|
      if @match.update_attributes(params[:match])
        
        @ticket_ids.each do |t_id|
          ticket = Ticket.find(t_id)
          ticket.match = @match
          ticket.status = 'matched' 
          ticket.save
        end 
        
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    respond_to do |format|
      format.html { redirect_to matches_url }
      format.json { head :no_content }
    end
  end
end
