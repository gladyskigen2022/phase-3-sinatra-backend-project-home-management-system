class MembersController < ApplicationController
    #Routings
    #Get all members
    get "/members" do
        members = Member.all
        members.to_json#(include: [:assets, :categories])
     end

    #  get single member
    get "/members/:id" do
        count_members = Member.where(id: params[:id]).count() #Integer 2,3,4,5
        if count_members>0
            members = Member.find_by(id: params[:id])
            members.to_json
        else
            message = {:error => "member do not exist"}
            message.to_json
        end
     end

    # add member
     post "/members" do
        member_name = params[:member_name]
        

        if(member.present?)
            member = Member.create(member_name: member_name)
            if member
                message = {:succcess => "Member created successfully!!"}
                message.to_json
            else
                message = {:error => "Error saving member!"}
                message.to_json
            end
        else
            message = {:error => "The field should be filled!"}
            message.to_json
        end
    end

    #edit
    patch '/members/:id' do
        check_member_existence = Member.exists?(id: params[:id]) #true/ false
        if check_member_existence
            member_name = params[:member_name]
            if(member.present?)
               # updating
                member = Member.find_by(id: params[:id])
                member.update(member_name: member_name)
                message = {:success => "Member updated successfully!"}
                message.to_json
            else
                message = {:error => "The field should be filled!"}
                message.to_json
            end

        else
            message = {:error => "The member does not exist!"}
            message.to_json
        end
    end

      # delete
      delete "/members/:id" do
        count_members = Member.where(id: params[:id]).count() #Integer 2,3,4,5
        if count_members>0
            member = Member.find(params[:id])
            member.destroy
            message = {:succcess => "Member deleted successfully!!"}
            message.to_json

        else
            message = {:error => "Member does not exist!"}
            message.to_json
        end


    end


    
end

    

