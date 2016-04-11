class RankingController < ApplicationController
    http_basic_authenticate_with name:"mjkim", password: "1234", 
    except: [:index, :show]

    def index
	@rankings = Ranking.all
    end

    def show
	@ranking = Ranking.find(params[:id])
    end

    def new
	@ranking = Ranking.new
    end

    def edit
	@ranking = Ranking.find(params[:id])
    end

    def create
        @ranking = Ranking.new(ranking_params)
	if @ranking.save
	    redirect_to @ranking
	else
	    render 'new'
	end
    end

    def update
        @ranking = Ranking.find(params[:id])
	if @ranking.update(ranking_params)
	    redirect_to @ranking
	else
	    render 'edit'
	end
    end

    def destroy
	@ranking = Ranking.find(params[:id])
	@ranking.destroy

	redirect_to ranking_index_path
    end

    private
	def ranking_params
	    params.require(:ranking).permit(:title, :text)
	end
end
