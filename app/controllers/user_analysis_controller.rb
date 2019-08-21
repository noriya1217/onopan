class UserAnalysisController < ApplicationController
  before_action :authenticate_store!

  def index
    @store = Store.find(current_store.id)
    gon.man = @store.users.where(sex: "男").count
    gon.woman = @store.users.where(sex: "女").count
    gon.teen = @store.users.where(age: 10).count
    gon.twenties = @store.users.where(age: 20).count
    gon.thirties = @store.users.where(age: 30).count
    gon.forties = @store.users.where(age: 40).count
    gon.fifties = @store.users.where(age: 50).count
    gon.society = @store.users.where(profession: "社会人").count
    gon.housewife = @store.users.where(profession: "主婦").count
    gon.student = @store.users.where(profession: "学生").count
    gon.part_time_job = @store.users.where(profession: "アルバイト").count
    gon.unemployed = @store.users.where(profession: "無職").count
  end
end


professions = ['社会人', '主婦', '学生', 'アルバイト', '無職']
