class AimsController < ApplicationController
  before_action :set_aim, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_user.aims.recent.ransack(params[:q])
    @aims = @q.result(distinct: true).page(params[:page]).per(5)

    respond_to do |format|
      format.html
      format.csv { send_data @aims.generate_csv, filename: "aims-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def show
  end
  

  def new
    @aim = Aim.new
  end

  def create
    @aim = current_user.aims.new(aim_params)
    if @aim.save
      AimMailer.creation_email(@aim).deliver_now
      flash[:success] = '目標を作成しました'
      redirect_to aim_path(@aim.id)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @aim.update(aim_params)
      flash[:success] = "目標を更新しました"
      redirect_to aim_path(@aim.id)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @aim.destroy
    flash[:success] = '目標を削除しました'
    redirect_to aims_path
  end

  def import
    current_user.aims.import(params[:file])
    flash[:success] = '目標を追加しました'
    redirect_to aims_path
  end

  private

    def set_aim
      @aim = current_user.aims.find(params[:id])
    end

   def aim_params
    params.require(:aim).permit(:title, :reason, :advantage, :difficulty, :image)
   end
end