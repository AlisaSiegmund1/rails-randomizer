class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    select_team
  end

  def order
    set_active_members
    if !@team == nil?
      @members = @active_members.shuffle
    end
  end


  def group
    set_active_members
    if @team == nil?
      @members = @active_members.shuffle
    end

    @groupsize = params[:group_by]

    if params[:group_by].blank?
      @groups = []
    else
      @groups = @active_members.shuffle.each_slice(@groupsize.to_i).to_a
    end
  end


  def pick
    set_active_members
    if !@teams.nil?
      @member = @active_members.sample
    end

  end

  def surprise
    @team = Team.all
  end

  def set_teams
    if Team.all.empty?
      @message = "PLEASE CREATE TEAM"
    else
      @teams = Team.all
    end
  end

  def set_team
    set_teams

    if !@teams.nil?
      if @teams.length == 1 || Selection.all.empty?
        @team = Team.last
      else
        @team = Team.find(Selection.last.team_id)
      end
    end
  end

  def set_active_members
    set_team
    if !@team.nil?
      @members = @team.member_ids
      @active_members = []

      @members.each do |member|
        if Member.find(member).active_member == true
          @active_members << member
        end
      end
    end
  end

  def select_team
     @teams = Team.all.where(user: current_user)
    if @teams.length == 1 || Selection.all.empty?
      @team = Team.last
    else
      @team = Team.find(Selection.last.team_id)
    end
  end

  private

end
