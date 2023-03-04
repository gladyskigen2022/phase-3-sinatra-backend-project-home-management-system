class AssetsController < ApplicationController
#Routings
#Get all assets
get "/assets" do
    assets = Asset.all
    assets.to_json#(include: [:categories, :members])
 end

#  get single asset
get "/assets/:id" do
    count_assets = Asset.where(id: params[:id]).count() #Integer 2,3,4,5
    if count_assets>0
        assets = Asset.find_by(id: params[:id])
        assets.to_json
    else
        message = {:error => "asset do not exist"}
        message.to_json
    end
 end

# add asset
 post "/assets" do
    item_name = params[:item_name]
    category = params[:category]
    date_of_purchase = params[:date_of_purchase]
    warranty = params[:warranty]
    brand = params[:brand]
    price = params[:price]
    comment = params[:comment]
    image = params[:image]
    category_id = params[:category_id]
    member_id = params[:member_id]
    
    
    if(item_name.present? && category.present? && date_of_purchase.present?)
        asset = Asset.create(item_name: item_name, category: category, date_of_purchase: date_of_purchase, warranty: warranty, brand: brand, price: price, comment: comment, image: image, category_id: category_id, member_id: member_id)
        if asset
            message = {:succcess => "Asset created successfully!!"}
            message.to_json
        else
            message = {:error => "Error saving asset!"}
            message.to_json
        end
    else
        message = {:error => "The fields should be filled!"}
        message.to_json
    end
end

#edit
patch '/assets/:id' do
    check_asset_existence = Asset.exists?(id: params[:id]) #true/ false
    if check_asset_existence
        item_name = params[:item_name]
        category = params[:category]
        date_of_purchase = params[:date_of_purchase]
        warranty = params[:warranty]
        brand = params[:brand]
        price = params[:price]
        comment = params[:comment]
        image = params[:image]
        category_id = params[:category_id]
        member_id = params[:member_id]
        if(item_name.present? && category.present? && date_of_purchase.present?)
           # updating
            asset = Asset.find_by(id: params[:id])
            asset.update(item_name: item_name, category: category, date_of_purchase: date_of_purchase, warranty: warranty, brand: brand, price: price, comment: comment, image: image, category_id: category_id, member_id: member_id)
            message = {:success => "Asset updated successfully!"}
            message.to_json
        else
            message = {:error => "The fields should be filled!"}
            message.to_json
        end

    else
        message = {:error => "The asset does not exist!"}
        message.to_json
    end
end

  # delete
  delete "/assets/:id" do
    count_assets = Asset.where(id: params[:id]).count() #Integer 2,3,4,5
    if count_assets>0
        asset = Asset.find(params[:id])
        asset.destroy
        message = {:succcess => "asset deleted successfully!!"}
        message.to_json

    else
        message = {:error => "Asset does not exist!"}
        message.to_json
    end


end



end