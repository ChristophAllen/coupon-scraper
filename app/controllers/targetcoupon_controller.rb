class TargetcouponController < ApplicationController

    def save
        require 'watir'
        
        @browser = Watir::Browser.new :chrome, headless: true
        @browser.goto "https://www.coupons.com/coupons/food-coupons-107/"
        
        until @browser.div(:class=>"seg-label").exists? do sleep 1 end
        sleep 3
        
          #looking for 78 products       
        4.times do   # 1 should be 4 
            @browser.scroll.to :bottom
            sleep 3           
        end
        
        @products = @browser.divs(class: "pod-info")
        @productsLength = @products.length
        
        q = 0
        
        @products.each do |x|
            if q == 0
                q = q + 1 
            else
                title_placeholder = x.h5.text + " / " + x.p.text
                value_placeholder = x.h4.text
                @total = "ummm"
                Targetcoupon.create(store: "TargetCoupon/Manufacturer", link: "https://www.coupons.com/coupons/food-coupons-107/", title: title_placeholder, value: value_placeholder, total: @productsLength)
            end
        end
        
        redirect_to "https://rails-tutorial2-chriscma.c9users.io/targetcoupon/show"
        
    end
    
    
    def show
        @products = Targetcoupon.all
    end
    
    
    
    def delete
        Targetcoupon.delete_all
        @products = Targetcoupon.all
    end
    
    def destroy
        Targetcoupon.find(params[:id]).destroy
        redirect_to "https://rails-tutorial2-chriscma.c9users.io/targetcoupon/show"
    end
    
    def destroy
        Targetcoupon.find(params[:id]).destroy
        redirect_to "https://rails-tutorial2-chriscma.c9users.io/targetcoupon/show"
    end    
end

# UA/M6373/M6877