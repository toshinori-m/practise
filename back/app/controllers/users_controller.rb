module Api
  module V1
    class UsersController < ApplicationController

      def index
        users = User.order(created_at: :desc)
        users_array = users.map do |user|
          {
            id: user.id,
            content1: user.content1,
            content2: user.content2,
            content3: user.content3,
            content4: user.content4,
            created_at: user.created_at
          }
        end
        render json: users_array, status: 200
      end

      def show
        render json: { message: '成功しました', data: @user }, status: 200
      end

      def create
        users = User.new(content1: params[content1], content2: params[content2], content3: params[content3], content4: params[content4])
        if user.save
          render json: { message: '成功しました' }, status: 200
        else
          render json: { message: '保存出来ませんでした', errors: users.errors.messages }, status: :bad_request
        end
      end

      def destroy
        if @user.destroy
          render json: { message: '削除に成功しました' }, status: 200
        else
          render json: { message: '削除に失敗' }, status: 400
        end
      end

      private

      def user_params
        params
          .require(:user)
          .permit(:content1, :content2, :content3, :content4,)
      end
    end
  end
end
