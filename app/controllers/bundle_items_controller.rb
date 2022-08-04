class BundleItemsController < ApplicationController

  def new
    @bundle_item = find_bundle.items.build
  end

  def create
    @bundle_item = find_bundle.items.new(bundle_item_params)

    if !@bundle_item.save
      render :new, status: :unprocessable_entity
      return
    end

    redirect_to_quote_path(@bundle_item.bundle.quote, "Bundle item saved successfully.")
  end

  def edit
    @bundle_item = find_bundle_item
  end

  def update
    @bundle_item = find_bundle_item

    if !@bundle_item.update(bundle_item_params)
      render :edit, status: :unprocessable_entity
      return
    end

    redirect_to_quote_path(@bundle_item.bundle.quote, "Bundle item updated successfully.")
  end

  def destroy
    @bundle_item = find_bundle_item

    @bundle_item.destroy

    redirect_to_quote_path(@bundle_item.bundle.quote, "Bundle item destroyed successfully.")
  end

  private

    def redirect_to_quote_path(quote, notice)
      redirect_to quote_path(quote), notice: notice
    end

    def find_bundle_item
      BundleItem.find(params.fetch(:id))
    end

    def find_bundle
      Bundle.find(params.fetch(:id))
    end

    def bundle_item_params
      params.require(:bundle_item).permit(:name, :maybe_descr, :quantity, :unit_price)
    end
end
