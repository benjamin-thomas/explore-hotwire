class BundlesController < ApplicationController
  before_action :set_quote, only: [:new, :create]
  before_action :set_bundle, only: [:edit, :update, :destroy]

  def new
    @bundle = @quote.bundles.build
  end

  def create
    @bundle = @quote.bundles.build(bundle_params)

    if !@bundle.save
      render :new, status: :unprocessable_entity
      return
    end

    respond_to do |fmt|
      fmt.html { redirect_to quote_path(@bundle.quote), notice: "Bundle was successfully created." }
      fmt.turbo_stream { flash.now[:notice] = "Bundle was successfully created." }
    end

  end

  def edit
  end

  def update
    if !@bundle.update(bundle_params)
      render :edit, status: :unprocessable_entity
      return
    end

    respond_to do |fmt|
      fmt.html { redirect_to quote_path(@bundle.quote), notice: "Bundle updated successfully." }
      fmt.turbo_stream { flash.now[:notice] = "Bundle was successfully updated." }
    end
  end

  def destroy
    @bundle.destroy

    respond_to do |fmt|
      fmt.html { redirect_to quote_path(@bundle.quote), notice: "Bundle destroyed successfully." }
      fmt.turbo_stream { flash.now[:notice] = "Bundle was successfully destroyed." }
    end
  end

  private

    def set_quote
      @quote = Quote.find(params.fetch(:quote_id))
    end

    def set_bundle
      @bundle = Bundle.find(params.fetch(:id))
    end

    def bundle_params
      params.require(:bundle).permit(:ship_on)
    end
end
