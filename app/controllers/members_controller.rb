class MembersController < ApplicationController

  def new
    @member = Member.new
    @team = Team.find(params[:team_id])
  end

  def create
    @member = Member.new(member_params)
    @team = Team.find(params[:team_id])
    @member.team = @team

    if @member.save
      redirect_to team_path(@team)
    else
      render :new
    end
  end


  def destroy
    @member = Member.find(params["team_id"])
    @team = Team.find(params[:id])
    @member.destroy
    redirect_to team_path(@team)
  end

  def set_team
    @team = Team.find(params[:id])
  end

  private

  def member_params
    params.require(:member).permit(:name)
  end

end
