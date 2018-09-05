class BidsController < ApplicationController

  def create
    @bid = Bid.new(bid_params)
    respond_to do |format|
      if @bid.save
       format.html {redirect_to '@bid.item', notice: 'Your bid has been recorded!'}
       format.js {}
       format.json { render :show, location: @bid}
      else
        @item = @bid.item
        format.js { render "items/show", notice: "Bid not accepted" }
      end
    end

  end

    private
      def bid_params
        params.require(:bid).permit(:amount, :item_id)
    end
  
end

