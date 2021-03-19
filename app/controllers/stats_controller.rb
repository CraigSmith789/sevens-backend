class StatsController < ApplicationController

  def index
    stats = Stat.all
    render json: stats.to_json(except: [:created_at, :updated_at])
  end

  def show
    stat = Stat.find(params[:id])
    render json: stat.to_json(except: [:created_at, :updated_at])
  end

  def create 
    stat = Stat.new(stat_params)
       
    if stat.save 
      render json: stat.to_json(except: [:created_at, :updated_at])
    else
        render json: {error: "could not save"}
    end
  end

  def destroy 
    stat = Stat.find(params[:id])
    stat.destroy 
    render json: {message: "successfully deleted #{stat.name}"}
end
  private 

    def stat_params
        params.require(:stat).permit(:name, :played, :won)
    end
end