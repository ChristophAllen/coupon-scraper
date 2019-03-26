class SavingstarController < ApplicationController
    
    def delete
        Savingstar.delete_all
        @products = Savingstar.all
    end

    
    def save
        require 'watir'
        
        @browser = Watir::Browser.new :chrome, headless: true
        @browser.goto "https://savingstar.com/coupons"
        sleep 5
        
        3.times do 
            @browser.scroll.to :bottom
            sleep 4            
        end
    
        @products = @browser.spans(class: "details")  #title
        @productsPrice = @browser.spans(class: "relative")   #price
        @productsPriceArray = []
        @productsArray = []
        @productsLength = @products.length
        y = 0
        
        @products.each do |z|
            @productsArray.push(z.text)    
        end
        
        @productsPrice.each do |x|
           if x.text == "OneorMany"
           else
                @productsPriceArray.push(x.text)  
           end
        end
        
        while y < @productsLength
            title_placholder = @productsArray[y]
            value_placeholder = @productsPriceArray[y]
            Savingstar.create(title: title_placholder, value: value_placeholder, store: "SavingStar(Any Store)", link: "https://savingstar.com/coupons", total: @productsLength)
            y = y + 1
        end
            
        
         @products = Savingstar.all
         redirect_to "https://rails-tutorial2-chriscma.c9users.io/savingstar/show"
    end

    def show
        @products = Savingstar.all
    end
    
    def destroy
        Savingstar.find(params[:id]).destroy
        redirect_to "https://rails-tutorial2-chriscma.c9users.io/homepage/singleshow/savingstar"
    end

end