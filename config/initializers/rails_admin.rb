RailsAdmin.config do |config|
  config.parent_controller = ApplicationController.name

  config.authorize_with do
    redirect_to main_app.root_path,
      flash: {danger: "Access Denied"} unless current_user.admin?
  end

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
  end

  config.total_columns_width = 1000

  config.model User.name do
    list do
      field :id
      field :name
      field :login
      field :email
      field :role
      field :chatwork
      field :admin
    end

    edit do
      field :id
      field :avatar
      field :name
      field :login
      field :email
      field :role
      field :chatwork
      field :room_id
      field :admin
    end
  end

  config.model Room.name do
    edit do
      field :id
      field :name
      field :description
    end
  end
end