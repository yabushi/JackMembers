class BandController < ApplicationController

    layout 'summary'

    def index
      @msg = 'バンド一覧'
      @bands = Band.where('id > 1').order('teien desc','gakunai desc','created_at asc')
      @comas = Coma.where.not(band_id: 1)
    end
  
    def show
      @msg = 'バンド詳細'
      @data = Band.find(params[:id])
      @coma = Coma.all
    end
  
    def add
      @msg = 'バンド追加'
      @data = Band.new
    end
    def create
      @data = Band.new bands_params
      if @data.save then
        redirect_to '/band/admin'
      else
        render '/band/admin'
      end
    end
  
    def edit
      @msg = 'バンド編集'
      @data = Band.find(params[:id])
    end
    def update
      obj = Band.find(params[:id])
      obj.update(bands_params)
      redirect_to '/band/admin'
    end
  
    def delete
      @msg = 'バンド削除'
      @data = Band.find(params[:id])
      if request.post? then
        @data.destroy
        redirect_to '/band/admin'
      end
    end
  
    def admin
      @bands = Band.all.order('teien desc','gakunai desc','created_at asc')
    end
  
    private
    def bands_params
      params.require(:band).permit(:bandname, :members, :teien, :gakunai, :notes)
    end
end
