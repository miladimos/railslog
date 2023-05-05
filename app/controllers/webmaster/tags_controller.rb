class TagsController < ApplicationController
    def index
        @tags = Tag.all
    end

    def show
        @tag = Tag.find(params[:id])
    end

    def new
        @tag = Tag.new
      end
    
      def create
        @tag = Tag.new(tag_params)
    
        if @tag.save
          redirect_to @tag
        else
          render :new, status: :unprocessable_entity
        end
      end

    def edit
        @tag = Tag.find(params[:id])
      end
    
      def update
        @tag = Tag.find(params[:id])
    
        if @tag.update(tag_params)
          redirect_to @tag
        else
          render :edit, status: :unprocessable_entity
        end
      end
    
      def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy
    
        redirect_to root_path, status: :see_other
      end
    
      private
        def tag_params
          params.require(:tag).permit(:title, :body)
        end
    end
end
