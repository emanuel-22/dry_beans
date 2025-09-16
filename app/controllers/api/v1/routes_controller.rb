module Api
  module V1
    class RoutesController < ApplicationController
      # GET /api/v1/routes/:id
      def show
        route = Route.includes(trips: :stops).find(params[:id])
        render json: route, include: ['trips', 'trips.stops']
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Route not found' }, status: :not_found
      end
    end
  end
end
