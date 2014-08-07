class OrdersController < ApplicationController
  def index
    @orders = Order.order(:date_time => :desc)
    respond_to do |format|
      format.html
      #format.csv { send_data @orders.to_csv }
      #format.xls # { send_data @orders.to_csv(col_sep: "\t") }
    end
  end

  def show

  end

  def edit

  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Your order has been deleted.'}
      format.json { head :no_content}
    end
  end

  def import
    Order.import(params[:file])
    redirect_to orders_path, notice: "Orders imported."
  end

  private

  def order_params
    params.require(:order).permit!
    #TODO - add strong params
  end
end



