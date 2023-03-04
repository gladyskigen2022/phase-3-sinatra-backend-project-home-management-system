class CategoriesController < ApplicationController
#Routings
#Get all categories
        get "/categories" do
            categories = Category.all
            categories.to_json#(include: [:assets, :members])
         end

        #  get single category
        get "/categories/:id" do
            count_categories = Category.where(id: params[:id]).count() #Integer 2,3,4,5
            if count_categories>0
                categories = Category.find_by(id: params[:id])
                categories.to_json
            else
                message = {:error => "category do not exist"}
                message.to_json
            end
         end

        # add category
         post "/categories" do
            category_name = params[:category_name]
            
            if(category_name.present?)
                category = Category.create(category_name: category_name)
                if category
                    message = {:succcess => "Category created successfully!!"}
                    message.to_json
                else
                    message = {:error => "Error saving category!"}
                    message.to_json
                end
            else
                message = {:error => "The field should be filled!"}
                message.to_json
            end
        end

        #edit
        patch '/categories/:id' do
            check_category_existence = Category.exists?(id: params[:id]) #true/ false
            if check_category_existence
                category_name = params[:category_name]
                if(category.present?)
                   # updating
                    category = Category.find_by(id: params[:id])
                    category.update(category_name: category_name)
                    message = {:success => "Category updated successfully!"}
                    message.to_json
                else
                    message = {:error => "The field should be filled!"}
                    message.to_json
                end

            else
                message = {:error => "The category does not exist!"}
                message.to_json
            end
        end

          # delete
          delete "/categories/:id" do
            count_categories = Category.where(id: params[:id]).count() #Integer 2,3,4,5
            if count_categories>0
                category = Category.find(params[:id])
                category.destroy
                message = {:succcess => "Category deleted successfully!!"}
                message.to_json

            else
                message = {:error => "Category does not exist!"}
                message.to_json
            end


        end


        
    end

        
