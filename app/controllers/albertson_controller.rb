class AlbertsonController < ApplicationController
    def save
        require 'watir'
        @browser = Watir::Browser.new :chrome, headless: true
        # @browser.goto "https://www1.albertsons.com/ShopStores/justforU.page"
        @browser.goto "https://www1.albertsons.com/CMS/account/login/?FullSite=Y&goto=https:%2F%2Fwww1.albertsons.com%2FShopStores%2FjustforU.page"
        sleep 3
        @browser.text_field(name: "label-email").set("chriscma@gmail.com")
        @browser.text_field(name: "password-password").set("guppy303")
        @button = @browser.button(id: "create-account-btn")
        @button.click
        sleep 3
        @browser.goto "https://www1.albertsons.com/ShopStores/Justforu-Coupons.page?FullSite=Y&reloaded=true#/offerTypes/CC"
        sleep 3 
        3.times do 
            @browser.send_keys :space
            sleep 1
        end
        5.times do # 5=212, 3 = 126, 4 = 189 (i triple checked and 4.times comes out to 189 each time)
            @browser.send_keys :space
            @browser.send_keys :space
            @browser.send_keys :space
            @browser.send_keys :space
            @browser.send_keys :space
            @browser.send_keys :space
            sleep 3
        end
        @products = @browser.divs(class: "lt-info") # 212 length
        @productsLength = @products.length 
        # 0 = price, 3 = title, 4 = description
        @products.each do |x|
            Kroger.create(title: x.divs[3].text + " / " + x.divs[4].text, value: x.divs[0].text, store: "Albertsons", link: "https://www1.albertsons.com/CMS/account/login/?FullSite=Y&goto=https:%2F%2Fwww1.albertsons.com%2FShopStores%2FjustforU.page", total: @productsLength)
            Albertson.create(title: x.divs[3].text + " / " + x.divs[4].text, value: x.divs[0].text, store: "Albertsons", link: "https://www1.albertsons.com/CMS/account/login/?FullSite=Y&goto=https:%2F%2Fwww1.albertsons.com%2FShopStores%2FjustforU.page", total: @productsLength)
        end
        @products = Albertson.all
    end
    
    def show
        @products = Albertson.all
    end
    
    def delete
        Albertson.delete_all
        Kroger.all.each do |x|  # this doesn't seem to work 
            if x.store == "Albertsons"
               x.destroy 
            end
        end
        @products = Alberton.all
    end
    
    def destroy
        Albertson.find(params[:id]).destroy
        redirect_to "https://rails-tutorial2-chriscma.c9users.io/homepage/singleshow/albertson"
    end
end

# browser.text_field(:name, "username").set("John Doe")
# browser.text_field(:name, "password").set("p@ssw0rd")
# browser.button(:name, "Submit").click