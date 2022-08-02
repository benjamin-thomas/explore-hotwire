class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]
  before_action :set_maybe_top, only: [:new, :edit, :create]

  def index
    @quotes = current_company.quotes.order_by_created_at_desc
  end

  def show
    @bundles = @quote.bundles.order_by_ship_on_asc
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = current_company.quotes.build(quote_params)

    if !@quote.save
      render :new, status: :unprocessable_entity
      return
    end

    respond_to do |fmt|
      fmt.html { redirect_to quotes_path, notice: "Quote was successfully created." }
      fmt.turbo_stream { flash.now[:notice] = "Quote was successfully created." }
    end
  end

  def edit
  end

  def update
    if !@quote.update(quote_params)
      render :edit, status: :unprocessable_entity
      return
    end

    respond_to do |fmt|
      fmt.html { redirect_to quotes_path, notice: "Quote was successfully updated." }
      fmt.turbo_stream { flash.now[:notice] = "Quote was successfully updated." }
    end
  end

  def destroy
    @quote.destroy

    respond_to do |fmt|
      fmt.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
      fmt.turbo_stream { flash.now[:notice] = "Quote was successfully destroyed." }
    end
  end

  private

    def set_quote
      @quote = current_company.quotes.find(params[:id])
    end

    def set_maybe_top
      # User opened /quote/new or /quote/123/edit via ctrl+click and has javascript turned on
      @maybe_top = if request.headers['Turbo-Frame'].nil?
                     { turbo_frame: "_top" }
                   else
                     {}
                   end
    end

    def quote_params
      params.require(:quote).permit(:name)
    end
end
