module Api
  module V1
    class UsersController < ApplicationController
      def index
        muster
        return render json: muster, status: 200
      end

      def show
        return render json: { message: '成功しました', data: @user = User.find(params[:id]) }, status: 200
      end

      def create
        array_add = new_early
        return render json: { message: '成功しました', data: array_add }, status: 200 if array_add.save
        return render json: { message: '保存出来ませんでした', errors: array_add.errors.messages }, status: :bad_request
      end

      def destroy
        array = array_find
        return render json: { message: '削除に成功しました' }, status: 200 if array.destroy
        return render json: { message: '削除に失敗' }, status: 400
      end

      private
      def muster
        users = sort_users
        users_array(users)
      end

      def sort_users
        User.order(created_at: :desc)
      end

      def users_array(users)
        users.map do |user|
          repeat(user)
        end
      end

      def repeat(user)
        { id: user.id,
          content1: user.content1,
          content2: user.content2,
          content3: user.content3,
          content4: user.content4,
          created_at: user.created_at
        }
      end

      def new_early
        User.new (information)
      end

      def information
        { content1: params[:content1],
          content2: params[:content2],
          content3: params[:content3],
          content4: params[:content4]
        }
      end

      def array_find
        User.find(params[:id])
      end
    end
  end
end
