class TestingController < ApplicationController
    
    def index
        require 'watir'
        @browser = Watir::Browser.new :chrome, headless: true
        @browser.goto "https://vmh.selectlabsoft.com/login"
        
        @spans = @browser.divs 
    end
end
