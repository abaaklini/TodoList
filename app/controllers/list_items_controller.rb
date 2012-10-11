class ListItemsController < ApplicationController
  def index
      @todo_list = TodoList.find(params[:todo_list_id])
      @list_items = @todo_list.list_items
  end

  def show
      @todo_list = TodoList.find(params[:todo_list_id])
      @list_item = @todo_list.list_items.find(params[:id])
  end

  def new
      @todo_list = TodoList.find(params[:todo_list_id])
      @list_item = @todo_list.list_items.build
  end

  def create
      @todo_list = TodoList.find(params[:todo_list_id])
      @list_item = @todo_list.list_items.build(params[:list_item])
      if @list_item.save
          redirect_to todo_list_list_item_url(@todo_list, @list_item)
      else
          render :action => "new"
      end
  end

  def edit
      @todo_list = TodoList.find(params[:todo_list_id])
      @list_item = @todo_list.list_items.find(params[:id])
  end

  def update
      @todo_list = TodoList.find(params[:todo_list_id])
      @list_item = ListItem.find(params[:id])
      if @list_item.update_attributes(params[:list_item])
          redirect_to todo_list_list_item_url(@todo_list, @list_item)
      else
          render :action => "edit"
      end
  end

  def destroy
      @todo_list = TodoList.find(params[:todo_list_id])
      @list_item = ListItem.find(params[:id])
      @list_item.destroy

      respond_to do |format|
          format.html { redirect_to todo_list_list_items_path(@todo_list) }
          format.xml  { head :ok }
      end
  end
end
