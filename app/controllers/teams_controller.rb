class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id
    if @team.save
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  def update
    set_team
    @team.update(team_params)
    redirect_to team_path(@team)
  end

  def show
    set_team
    @user = User.find(@team.user_id)
    @members = Member.all.order('id ASC')
  end

  def edit
    set_team
  end

  def destroy
    set_team
    @team.delete
    redirect_to teams_path
  end


  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:title)
  end

end
