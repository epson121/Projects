class AlarmClockController < ApplicationController

  def index
    @hours = (0..23).map{|n| n < 10 ? n = "0" + n.to_s : n}
    @minutes = (0..59).map{|n| n < 10 ? n = "0" + n.to_s : n}
  	a = []
  	if params[:t] == "ok"
  		a << Time.new.hour.to_s
  		a << Time.new.min.to_s
  		a << Time.new.sec.to_s
  		a = a.map {|n| if n.length < 2; n = "0" + n; else; n = n; end}
  		@time = a[0] + ":" + a[1] + ":" + a[2]

      if !session[:h].nil? and session[:h] == a[0] and session[:m] == a[1]
        session[:h] = nil
        session[:m] = nil
        render :js => "window.location = '/alarm'"
      else
        respond_to do |format|
          format.js
        end
      end
  	end
  end

  def set
    @h = params[:hours]
    @m = params[:minutes]
    session[:h] = @h
    session[:m] = @m
    respond_to do |format|
        format.js
    end
  end

  def alarm

  end
end
