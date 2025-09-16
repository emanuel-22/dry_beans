module Api
  module V1
    class DeliveriesController < ApplicationController
      # POST /api/v1/trips/:trip_id/stops/:id/complete  (guardar datos de entrega)
      
      def complete
        trip = Trip.find(params[:trip_id])
        stop = trip.stops.find(params[:id])

        # params permitidos para completar
        permitted = params.require(:stop).permit(:recipient_name, :recipient_document, :signature_url, :photo_url, :latitude, :longitude, :notes, :attempts)
        stop.mark_completed!(permitted.to_h.symbolize_keys)

        if stop.save
          render json: stop, status: :ok
        else
          render json: { errors: stop.errors.full_messages }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Trip or Stop not found' }, status: :not_found
      end

      # optionally: create a stop (POST /api/v1/trips/:trip_id/stops)
      def create
        trip = Trip.find(params[:trip_id])
        stop = trip.stops.new(stop_params)
        if stop.save
          render json: stop, status: :created
        else
          render json: { errors: stop.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def stop_params
        params.require(:stop).permit(:kind, :scheduled_at, :recipient_name, :recipient_document, :notes, :external_id)
      end
    end
  end
end
