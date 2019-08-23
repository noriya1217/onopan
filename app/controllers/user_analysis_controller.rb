class UserAnalysisController < ApplicationController
  before_action :authenticate_store!

  def index
    @store = Store.find(current_store.id)
    @man = gon.man = @store.users.where(sex: "男").count
    @woman = gon.woman = @store.users.where(sex: "女").count
    @teen = gon.teen = @store.users.where(age: 10).count
    @twenties = gon.twenties = @store.users.where(age: 20).count
    @thirties = gon.thirties = @store.users.where(age: 30).count
    @forties = gon.forties = @store.users.where(age: 40).count
    @fifties = gon.fifties = @store.users.where(age: 50).count
    @society = gon.society = @store.users.where(profession: "社会人").count
    @housewife = gon.housewife = @store.users.where(profession: "主婦").count
    @student = gon.student = @store.users.where(profession: "学生").count
    @part_time_job = gon.part_time_job = @store.users.where(profession: "アルバイト").count
    @unemployed = gon.unemployed = @store.users.where(profession: "無職").count
  end
end


professions = ['社会人', '主婦', '学生', 'アルバイト', '無職']
