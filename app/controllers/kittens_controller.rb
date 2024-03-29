class KittensController < ApplicationController
    def index
        @kittens = Kitten.all
        respond_to do |format|
            format.html
            format.json { render :json => @kittens }
        end
    end

    def new
        @kitten = Kitten.build()
    end

    def show
        @kitten = Kitten.find(params[:id])

        respond_to do |format|
            format.html
            format.json { render :json => @kittens }
        end
    end

    def create
        @kitten = Kitten.new(kitten_params)

        if @kitten.save
            flash[:notice] = "#{@kitten.name} was created"
            redirect_to kitten_path(@kitten)
        else
            flash[:alert] = 'Something went wrong, check your fields'
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @kitten = Kitten.find(params[:id])
    end

    def destroy
        @kitten = Kitten.find(params[:id])

        if @kitten.destroy
          flash[:notice] = "#{@kitten.name} was deleted"
          redirect_to :root
        else
          flash[:alert] = 'Something went wrong'
          render @kitten, status: 422
        end
    end

    def update
        @kitten = Kitten.find(params[:id])

        if @kitten.update(kitten_params)
            flash[:notice] = 'Kitten is updated'
            redirect_to @kitten
         else
            flash[:notice] = 'Kitten is not updated'
            render :edit
        end
    end

    private 
    def kitten_params 
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
