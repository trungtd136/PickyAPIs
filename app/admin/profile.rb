ActiveAdmin.register Profile do
  index do
    column :name
    column :email
    column :profile_icon
    default_actions
  end

  filter :name
  filter :email

  controller do
    def permitted_params
      params.permit profile: [:name, :email, :profile_icon]
    end
  end
end