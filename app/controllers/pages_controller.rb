class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    set_team
  end

  def order
    set_active_members
    if !@team.blank?
      @members = @active_members.shuffle
    end
  end

  def group
    set_active_members
    @groupsize = params[:group_by]

    if params[:group_by].blank?
      @groups = []
    else
      if !@team.blank?
        @groups = @active_members.shuffle.each_slice(@groupsize.to_i).to_a
      end
    end
  end

  def pick
    set_active_members
    if !@teams.blank?
      @member = @active_members.sample
    end
  end

  def surprise
    # To be continued
  end

# Define @TEAMS so it'll only contain teams of current user
  def set_teams
    if Team.all.where(user: current_user).blank?
      @teams = []
    else
      @teams = Team.all.where(user: current_user)
    end
  end

# Draw one @TEAM of @TEAMS on which the actions will be performed
  def set_team
    set_teams

    if !@teams.blank?
      if @teams.length == 1 || Selection.all.blank?
        @team = Team.last
      else
        @team = Team.find(Selection.last.team_id)
      end
    else
      @team = []
    end
  end

# Return @ACTIVE_MEMBERS only, so actions wont consider inactive members
  def set_active_members
    set_team
    if !@team.blank?
      members = @team.member_ids
      @active_members = []

      members.each do |member|
        if Member.find(member).active_member == true
          @active_members << member
        end
      end
    end
  end

  private

end
