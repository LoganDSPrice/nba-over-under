class LocksController < ApplicationController
  def create
    @lock = Lock.new(lock_params)

    if @lock.save
      render "replace_lock"
    else
      @lock = Lock.new(lock_params)
    end
  end
  
  def destroy
    pick = Pick.find(params[:pick_id])
    pick.lock.destroy
    @lock = pick.build_lock
    render "replace_lock", locals: { pick: pick }
  end

  private

  def lock_params
    @lock_params ||= params.require(:lock).permit(:pick_id)
  end
end
