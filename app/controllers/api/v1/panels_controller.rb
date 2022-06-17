module Api
  module V1
    class PanelsController < ApplicationController
      before_action :set_panel, only: [:show, :update, :destroy]

      def index
        panels = Panel.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded panels', data: panels }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the panels', data: @panel }
      end

      def create
        panel = Panel.new(panel_params)
        if panel.save
          render json: { status: 'SUCCESS', data: panel }
        else
          render json: { status: 'ERROR', data: panel.errors }
        end
      end

      def destroy
        @panel.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the panel', data: @panel }
      end

      def update
        if @panel.update(panel_params)
          render json: { status: 'SUCCESS', message: 'Updated the panel', data: @panel }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @panel.errors }
        end
      end

      private

      def set_panel
        @panel = Panel.find(params[:id])
      end

      def panel_params
        params.permit(:guild, :name, :channel, :message)
      end
    end
  end
end
