class IbottaController < ApplicationController
    def save
        require 'watir'
        
        @browser = Watir::Browser.new :chrome, headless: true
        @browser.goto "https://ibotta.com/rebates"
        
        until @browser.footer(:id=>"ember24").exists? do sleep 1 end
        
        #1211 total products on ibotta 
        #15 = 320
        #30 = 620 
        #40 = 820 
        # 30 is what I can comfortably do 
        30.times do 
            @browser.send_keys :space
            @browser.send_keys :space
            @browser.send_keys :space
            sleep 1
        end
        
        @products = @browser.divs(class: "info")
        @productsLength = @products.length
        
        @products.each do |x|
            Ibotta.create(title: x.divs[1].text, value: x.divs[0].text, store: x.divs[2].text + " iBotta", link: "https://ibotta.com/rebates", total: @productsLength)
        end
        
        @products = Ibotta.all
        # redirect_to "https://rails-tutorial2-chriscma.c9users.io/homepage/singleshow/ibotta"
    end



    def show
        @products = Ibotta.all
        @test = "test"
    end
    
    
    
    def delete
        Ibotta.delete_all
        @products = Ibotta.all
    end
    
    
    def practice
        
    end
    
    def destroy
        Ibotta.find(params[:id]).destroy
        redirect_to "https://rails-tutorial2-chriscma.c9users.io/homepage/singleshow/ibotta"
    end
    
end
