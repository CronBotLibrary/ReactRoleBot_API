module Api
  module V1
    class DictsController < ApplicationController
      before_action :set_dict, only: [:show, :update, :destroy]

      def index
        dicts = Dict.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded dicts', data: dicts }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the dict', data: @dict }
      end

      def create
        dict = Dict.new(dict_params)
        if dict.save
          render json: { status: 'SUCCESS', data: dict }
        else
          render json: { status: 'ERROR', data: dict.errors }
        end
      end

      def destroy
        @dict.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the dict', data: @dict }
      end

      def update
        if @dict.update(dict_params)
          render json: { status: 'SUCCESS', message: 'Updated the dict', data: @dict }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @dict.errors }
        end
      end

      private

      def set_dict
        @dict = Dict.find(params[:id])
      end

      def dict_params
        params.permit(:id, :key, :value, :server_id, :is_regex)
      end
    end
  end
end
