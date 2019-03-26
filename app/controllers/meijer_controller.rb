class MeijerController < ApplicationController
    def save
        require 'watir'
        @browser = Watir::Browser.new :chrome, headless: true
        @browser.goto "https://mperks.meijer.com/mperks/Coupon#/available"
        
        sleep 5
        
        @products = @browser.divs(class: "content-overflow")
        @productsLength = @products.length
        
        @products.each do |x| 
            Meijer.create(title: x.ps[0].text, value: x.divs[0].text, store: 'Meijer', link: "https://mperks.meijer.com/mperks/Coupon#/available", total: @productsLength)
            Kroger.create(title: x.ps[0].text, value: x.divs[0].text, store: 'Meijer', link: "https://mperks.meijer.com/mperks/Coupon#/available", total: @productsLength)
        end
        @products = Meijer.all
    end
    
    def show
        @products = Meijer.all
    end
    
    def delete
        Meijer.delete
        Kroger.all.each do |x|  # this doesn't seem to work 
            if x.store == "Meijer"
               x.destroy 
            end
        end
        @products = Meijer.all
    end
    
    def destroy
        Meijer.find(params[:id]).destroy
        redirect_to "https://rails-tutorial2-chriscma.c9users.io/homepage/singleshow/meijer"
    end
end