class <%= controller_class_name %>Controller < ApplicationController
  respond_to :html, :json

<% unless options[:singleton] -%>
  expose(:<%= table_name %>) { <%= orm_class.all(class_name) %> }
<% end -%>
  expose(:<%= file_name %>)

<% unless options[:singleton] -%>
  def index
    respond_with <%= table_name %>
  end
<% end -%>

  def show
    respond_with <%= file_name %>
  end

  def new
    respond_with <%= file_name %>
  end

  def edit
    respond_with <%= file_name %>
  end

  def create
    flash.notice = '<%= class_name %> was created successfully.' if <%= file_name %>.save
    respond_with <%= file_name %>
  end

  def update
    flash.notice = '<%= class_name %> was updated successfully.' if <%= file_name %>.save
    respond_with <%= file_name %>
  end

  def destroy
    <%= file_name %>.destroy
    respond_with <%= file_name %>
  end
end
