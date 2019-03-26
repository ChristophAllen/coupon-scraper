class HebController < ApplicationController
    
    def save
        require 'watir'
        @browser = Watir::Browser.new :chrome, headless: true
        @browser.goto "https://www.heb.com/digital-coupon/coupon-selection"
        sleep 5
        
        @browser.send_keys :space
        @browser.send_keys :space
        @browser.send_keys :space
        @browser.send_keys :space
        25.times do # 240 / 240 / 240 / 240 / 
            @browser.send_keys :space
            sleep 3
        end
        
        counter = 0
        
        @products = @browser.divs(class: "coupon-description")
        @values = @browser.divs(class: "coupon-offer")
        @productsLength = @products.length 
        
        while counter < @products.length 
            Heb.create(title: @products[counter].text, value: @values[counter].text, store: "HEB", link: "https://www.heb.com/digital-coupon/coupon-selection", total: @productsLength)
            Kroger.create(title: @products[counter].text, value: @values[counter].text, store: "HEB", link: "https://www.heb.com/digital-coupon/coupon-selection", total: @productsLength)
            counter = counter + 1
        end
        @products = Heb.all
    end
    
    def show
       @products = Heb.all 
    end
    
    def delete
        Heb.delete_all
        Kroger.all.each do |x|  # this doesn't seem to work 
            if x.store == "HEB"
               x.destroy 
            end
        end
        @products = Heb.all
    end
    
    def destroy
        Heb.find(params[:id]).destroy
        redirect_to "https://rails-tutorial2-chriscma.c9users.io/homepage/singleshow/heb"
    end
    
end


#  div class coupon-offer - value
# coupon description - title