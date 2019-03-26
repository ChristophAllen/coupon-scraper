class Checkout51Controller < ApplicationController
    #on checkout and ned to log into sight to see more deals but it works for the many products that show up now 
    def delete
        Checkout51.delete_all
        @products = Checkout51.all
    end
    
    def save
        require 'watir'
        @browser = Watir::Browser.new :chrome, headless: true
        @browser.goto "https://www.checkout51.com/offers"
        
        @products = @browser.lis(class: "offer")
        @productsLength = @products.length
        
        @products.each do |x|
            Checkout51.create(title: x.divs[13].text, value: x.divs[14].text, link: 'https://www.checkout51.com/offers', store: "Checkout51", total: @productsLength)
        end
        @products = Checkout51.all
        # redirect_to "https://rails-tutorial2-chriscma.c9users.io/homepage/singleshow/checkout"
    end
    
    def show
        @products = Checkout51.all
    end
    
    def practice
        
    end
    
    def destroy
        Checkout51.find(params[:id]).destroy
        redirect_to "https://rails-tutorial2-chriscma.c9users.io/checkout51/show"
    end
    
    def destroy
        Checkout51.find(params[:id]).destroy
        redirect_to "https://rails-tutorial2-chriscma.c9users.io/homepage/singleshow/checkout51"
    end
    
end