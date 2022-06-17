module Api
  module V1
    class RolesController < ApplicationController
      before_action :set_role, only: [:show, :update, :destroy]

      def index
        roles = Role.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded roles', data: roles }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the role', data: @role }
      end

      def create
        role = Role.new(role_params)
        if role.save
          render json: { status: 'SUCCESS', data: role }
        else
          render json: { status: 'ERROR', data: role.errors }
        end
      end

      def destroy
        @role.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the role', data: @role }
      end

      def update
        if @role.update(role_params)
          render json: { status: 'SUCCESS', message: 'Updated the role', data: @role }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @role.errors }
        end
      end

      private

      def set_role
        @role = Role.find(params[:id])
      end

      def role_params
        params.permit(:id, :name, :tts_blocked)
      end
    end
  end
end
