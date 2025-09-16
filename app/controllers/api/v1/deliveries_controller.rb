module Api
  module V1
    class DeliveriesController < ApplicationController
      # POST /api/v1/trips/:trip_id/stops/:id/complete  (guardar datos de entrega)
      before_action :set_delivery, only: [:show, :update, :destroy, :mark_completed]

      def create
        delivery = Delivery.new(stop_params)
        if delivery.save
          render json: delivery, status: :created
        else
          render json: delivery.errors, status: :unprocessable_entity
        end
      end

      def mark_completed
        if @delivery.mark_completed!(mark_completed_params)
          render json: @delivery
        else
          render json: @delivery.errors, status: :unprocessable_entity
        end
      end

      private
        def set_delivery
          @delivery = Delivery.find(params[:id])
        end
        def delivery_params
          params.require(:delivery).permit(:trip_id, :status, :scheduled_at, :completed_at, :attempts_number)
        end
        def mark_completed_params
          params.permit(:photo_url, :latitude, :longitude, :recipient_name, :recipient_document, :notes)
        end
    end
  end
end
