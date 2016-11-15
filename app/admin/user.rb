ActiveAdmin.register User do
permit_params :user_name, :email, :password, :password_confirmation

form do |f|
	f.inputs 'Admin Details' do
		f.input :user_name
		f.input :email
		f.input :password
		f.input :password_confirmation
	end
	f.actions
end

index do 
	selectable_column
	id_column

	column :user_name
	column :email
	column :password
	column :password_confirmation
	actions
end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end