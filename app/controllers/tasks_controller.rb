class TasksController < ApplicationController
    before_action :get_category, only: [ :create, :edit, :update, :destroy, :new ] 

    def show
        @task = Task.find(params[:id])
    end

    def index
        @tasks = Task.order(due_date: :desc)
    end
    
    
    def new
        @task = Task.new
    end

    def create        
        @task = @category.tasks.new(params.require(:task).permit(:name, :description, :due_date))

        if @task.valid? 
            @task.save
            flash[:notice] = "Task created successfully!"
            redirect_to category_path(@category)
        else
            render 'new'
        end
    end

    def edit
        category = Category.find(params[:category_id])
        @task = @category.tasks.find(params[:id])
    end

    def update
        @task = @category.tasks.find(params[:id])
        if @task.valid? 
          @task.update(task_params)
          flash[:notice] = "Task updated successfully!"
          redirect_to @category
        else
          render 'edit'
        end
    end

    def destroy
        category = Category.find(params[:category_id])
        @task = category.tasks.find(params[:id])
        @task.destroy
        redirect_to category_path(category)
    end

    def get_category
        @category = Category.find(params[:category_id])
    end

    private

    def task_params
        params.require(:task).permit(:name, :due_date)
    end
end

