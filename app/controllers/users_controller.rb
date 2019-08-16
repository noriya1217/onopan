class UsersController < ApplicationController
  # before_action :authenticate_store!, only: [:index]
  before_action :set_user, only: [:update]
  # newとeditはLINEから送られてきた時だけアクセス許可する。

  def index; end

  def new
    @user = User.new
    # @user.line_id = @user_id
  end
  
  def create
    # TODO: 同時にcreateされた時にずれが生じる可能性がある
    if params[:line_id].present?
      if User.find_by(line_id: params[:line_id])
        puts "既に登録されているLINE_IDです。"
      else
        user = User.new
        user.name = "nil"
        user.email = "nil"
        user.address = "nil"
        user.line_id = params[:line_id]
        if user.save
          puts "line_id登録成功"
        else
          puts "line_id登録失敗"
        end
      end
    else
      user = User.last
      user_not_line_id = User.new(user_params)
      if user.email == "nil" && user.address == "nil" && user.line_id.present?
        user.name = user_not_line_id.name
        user.age = user_not_line_id.age
        user.sex = user_not_line_id.sex
        user.profession = user_not_line_id.profession
        user.email = user_not_line_id.email
        user.address = user_not_line_id.address
        if user.save
          puts "user登録成功"
        else
          puts "user登録失敗"
          @user = user
          user.destroy
          render :new
        end
      else
        puts "既に登録されているLINE_IDでuser登録処理を行おうとしています"
      end
    end
  end

  def edit
    @user = User.find_by(line_id: @line_id)
    render :edit
  end

  def update

  end

  def edit_search
    if params[:line_id].present?
      @line_id = params[:line_id]
      edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :age, :sex, :profession, :email, :address)
  end

  def recieve
    body = request.body.read
    events = client.parse_events_from(body)
    events.each do |event|
      @user_id = event['source']['userId']
    end
  end
end
