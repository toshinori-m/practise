module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: users_array, status: 200
      end

      def show
        render json: { message: '成功しました', data: find_user }, status: 200
      end

      def create
        return render json: { message: '成功しました', data: new_user }, status: 200 if new_user.save

        render json: { message: '保存出来ませんでした', errors: new_user.errors.messages }, status: 400
      end

      def destroy
        return render json: { message: '削除に成功しました' }, status: 200 if find_user.destroy
        
        render json: { message: '削除に失敗' }, status: 400
      end

      private
      
      def users_array
        User.order(created_at: :desc).map do |user|
          user_hash(user)
        end
      end

      def user_hash(user)
        {
          id: user.id,
          content1: user.content1,
          content2: user.content2,
          content3: user.content3,
          content4: user.content4,
          created_at: user.created_at
        }
      end

      def new_user
        User.new(create_params)
      end

      def create_params
        {
          content1: params[:content1],
          content2: params[:content2],
          content3: params[:content3],
          content4: params[:content4]
        }
      end

      def find_user
        User.find(params[:id])
      end
    end
  end
end
