class EventsController < ApplicationController
   before_filter :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]
  # GET /events
  # GET /events.json
  def index

    
      @events = Event.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @events }
      end
   
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    #@event.date_event = params[:event[date_event]]
    #@event.description = params[:event[description]]
    #@event.time_event = params[:event[time_event]]
    #@event.title = params[:event[title]]
    #@event.place = params[:event[place]]

    #if params[mobile] != nil
     # @user.user_id = params[:event[user_id]]
      #@user.neighborhood_id.id = params[:event[neighborhood_id]]
    #else        
    @event.user_id = current_user.id
    @event.neighborhood_id = current_user.neighborhood_id
    #end 

    respond_to do |format|
      if @event.save
        format.html { redirect_to home_index_path, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /events/new/registers
  # POST /events/new/registers.json
  def new_registers
    @event = Event.new
    @event.title = params[:title]
    @event.description = params[:description]
    @event.date_event = params[:date_event]    
    @event.time_event = params[:time_event]    
    @event.place = params[:place]
    @event.user_id = params[:user_id]
    @event.neighborhood_id = params[:neighborhood_id]

    respond_to do |format|
      if @event.save
        #format.html { redirect_to home_index_path, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        #format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # PUT /events/update/registers/1.json
  def update_registers
    @event = Event.find(params[:id])
    @event.date_event = params[:date_event]
    @event.description = params[:description]
    @event.time_event = params[:time_event]
    @event.title = params[:title]
    @event.place = params[:place]

    respond_to do |format|
      if @event.update_attributes(params[:event])
        #format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render json: @event, status: :updated }
      else
        #format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :invalid_data }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

 
  # DELETE /events/destroy/registers/1.json
  def destroy_registers
    @event = Event.find(params[:id])
    @event.destroy
    response = "{\"status\":\"200\"}"
    respond_to do |format|
      
      format.json { render json: response}
    end
  end
end
