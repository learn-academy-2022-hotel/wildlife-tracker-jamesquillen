class AnimalSightingsController < ApplicationController

    def index
        sightings = AnimalSighting.all
        render json: sightings
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
            params.require(:animal_sighting).permit(:animal_id, :latitude, :longitude, :date)
        end
end
