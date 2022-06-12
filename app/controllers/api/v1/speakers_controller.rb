module Api
  module V1
    class SpeakersController < ApplicationController
      before_action :set_speaker, only: [:show, :update, :destroy]

      def index
        speakers = Speaker.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded speakers', data: speakers }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the speaker', data: @speaker }
      end

      def create
        speaker = Speaker.new(speaker_params)
        if speaker.save
          render json: { status: 'SUCCESS', data: speaker }
        else
          render json: { status: 'ERROR', data: speaker.errors }
        end
      end

      def destroy
        @speaker.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the speaker', data: @speaker }
      end

      def update
        if @speaker.update(speaker_params)
          render json: { status: 'SUCCESS', message: 'Updated the speaker', data: @speaker }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @speaker.errors }
        end
      end

      private

      def set_speaker
        @speaker = Speaker.find(params[:id])
      end

      def speaker_params
        params.permit(:id, :server_id, :engine, :value)
      end
    end
  end
end
