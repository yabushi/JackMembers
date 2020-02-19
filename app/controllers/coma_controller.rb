class ComaController < ApplicationController

    require 'by_star'
    layout 'summary'

    #一般ユーザ用
    def index
        @comalist = Coma.all
    end


    def add
        first = 0
        if Coma.maximum('date') == nil then
        today = DateTime.now
        if today.wday < 4 then
            weekstart = today - (today.wday - 4) - 7
        else
            weekstart = today - (today.wday-4)
        end
        else
        weekstart = Coma.maximum('date').tomorrow
        first = 1
        end

        term = ["1", "2", "昼", "3", "4", "5", "夜1", "夜2"]

        x = 0
        while x < 7 do
        y = 0
            if x != 0 then
            weekstart = weekstart.tomorrow
            end
        while y < 8 do
            Coma.new do |i|
            i.date = weekstart
            i.term = term[y]
            i.band_id = 1
            i.hitech = 'ハイテク'
            i.canmod = true
            i.save!
            y += 1
            end
        end
        x += 1
        end
        redirect_to '/coma/admin'
    end


    def edit
        @coma = Coma.find(params[:id])
        if request.patch? then
            @coma.update(comas_params)

            if params[:user] == 'admin' then
                redirect_to '/coma/admin'
            else
                redirect_to '/coma'
            end
        end
    end


    def regist
        @coma = Coma.find(params[:coma])
        @band = Band.find(params[:band])
        @coma.update( band_id:  @band.id )
        redirect_to '/coma/admin'
    end


    def delete 
        if Coma.minimum('date') == nil then
        redirect_to '/coma/admin'
        end
        @coma = Coma.minimum('date')
    end


    def destroy
        del = Coma.minimum('date')

        @coma = Coma.where('? <= date and date <= ?', del.beginning_of_month, del.end_of_month)
        @coma.each do |obj|
        obj.destroy
        end
        redirect_to '/coma/admin'
    end


    def buhi
        @coma = Coma.all
    end


    def buhi_show
        @month = params[:month]

        #該当月であり、元からハイテクでないコマを選別
        @comas = Coma.by_month(@month, field: :date).where.not(band_id: 1)
        @bands = Band.all.order('teien desc','gakunai desc','created_at asc').where.not(id: 1)
    end



    #管理者用
    def admin
        @comalist = Coma.all
    end

    def admin_edit
        @bands = Band.where('id > 1').order('teien desc','gakunai desc','created_at asc')
        @coma = Coma.find(params[:id])
        if request.patch? then
        @coma.update(comas_params)
        redirect_to '/coma/admin'
        end
    end



    #メソッド
    private
    def comas_params
        params.require(:coma).permit(:date, :term, :band_id, :hitech, :canmod)
    end
end
