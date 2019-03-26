class KrogerController < ApplicationController
    def delete
        Kroger.delete_all
        @products = Kroger.all
    end
    
    def show 
       @products = Kroger.all 
    end
    
    def save
        # Kroger.create(title: 'test')
    end
    
    # def destroy
    #     Kroger.find(params[:id]).destroy
    #     redirect_to "https://rails-tutorial2-chriscma.c9users.io/smiths/show"
    # end
end
