class HyveeController < ApplicationController
    def save
        require 'watir'
        @browser = Watir::Browser.new :chrome, headless: true
        @browser.goto "https://www.hy-vee.com/deals/coupons.aspx"
        
        @button = @browser.a(class: "btn-load-more")
        @button.click
        sleep 5
        
        @titles = []  # spans
        @values = []  # h3s 
        @products = @browser.divs(class: "product-desc")
        @productsLength = @products.length 
        
        @products.each do |x|
            Hyvee.create(title: x.spans[0].text, value: x.h3s[0].text, store: "HyVee", link: "https://www.hy-vee.com/deals/coupons.aspx", total: @productsLength)
            Kroger.create(title: x.spans[0].text, value: x.h3s[0].text, store: "HyVee", link: "https://www.hy-vee.com/deals/coupons.aspx", total: @productsLength)
        end
        @products = Hyvee.all
    end

    def delete 
        Hyvee.delete_all
        Kroger.all.each do |x|  # this doesn't seem to work 
            if x.store == "HyVee"
               x.destroy 
            end
        end
        @products = Hyvee.all
    end

    def show
        @products = Hyvee.all
    end

    def destroy
        Hyvee.find(params[:id]).destroy
        redirect_to "https://rails-tutorial2-chriscma.c9users.io/homepage/singleshow/hyvee"
    end

end
