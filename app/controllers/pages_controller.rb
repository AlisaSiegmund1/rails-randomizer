class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    select_team
  end

  def group
    set_active_memeber
    @members = @active_members.shuffle
    @groupsize = params[:group_by]

    if params[:group_by].blank?
    @groups = []
    else
    @groups = @members.each_slice(@groupsize.to_i).to_a
    end
  end

  def order
    set_active_memeber
    @members = @active_members.shuffle
  end

  def pick
    set_team
    @member = @team.member_ids.sample
  end

  def surprise
    @team = Team.all
  end

  def set_team
     @teams = Team.all
    if Team.all.length <= 1 || Selection.all.empty?
      @team = Team.last
    else
      @team = Team.find(Selection.last.team_id)
    end
  end

  def set_active_memeber
    set_team
    @members = @team.member_ids
    @active_members = []

    @members.each do |member|
      if Member.find(member).active_member == true
        @active_members << member
      end
    end
  end


 def select_team
     @teams = Team.all.where(user: current_user)
    if @teams.length <= 1 || Selection.all.empty?
      @team = Team.last
    else
      @team = Team.find(Selection.last.team_id)
    end
  end


  private

end
