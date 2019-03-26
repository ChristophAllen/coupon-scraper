class PublixController < ApplicationController
# require 'webdrivers'

    def save # I think what I need to do is try a different browser
        require 'watir'
        @browser = Watir::Browser.new :chrome, headless: true
        @browser.goto "https://ship.kroger.com/digital-coupons"
        sleep 5
        @body = @browser.body 
        
        # the button is in a section if that make any difference
        # @loadButton2 = @browser.buttons
        # sleep 10
        # @loadButton.last.click
        # sleep 10
        # @products2 = @browser.ps(class: "dc-card-description")
        # @body = @browser.body
    end 


# p dc-card-description 
    #     @total = @browser.divs(class: "col-10")
# js-btnLoadCoupons
end


# bundle exec rake db:rollback    
# rails destroy model <model_name>