class AnimalSightingsController < ApplicationController

    def index
        sightings = AnimalSighting.where(date: params[:start_date]..params[:end_date])
        render json: sightings
    end

    def show
        sighting = AnimalSighting.find(params[:id])
        render json: sighting
    end

    def create
        sighting = AnimalSighting.create(sighting_params)
        if sighting.valid?
            render json: sighting
        else
            render sighting.errors
        end
    end

    def update
        sighting = AnimalSighting.find(params[:id])
        sighting.update(sighting_params)
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
    end

    def destroy
        sighting = AnimalSighting.find(params[:id])
        if sighting.destroy
            render json: sighting
        else
            render json: sighting.errors
        end
    end


    private
        def sighting_params
            params.require(:animal_sighting).permit(:animal_id, :latitude, :longitude, :date, :start_date, :end_date)
        end
end
