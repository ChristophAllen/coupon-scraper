class StoresController < ApplicationController
    
    def albertsons
        
    end
    
    def everywhere
        @l = Triplesave.all
        a = Krogercheckout51
        b = Krogertargetcoupon
        c = Krogersavingstar
        j = Targetibottum
        
        d = Checkout51targetcoupon
        e = Checkout51savingstar
        f = Targetcouponsavingstar
        h = Ibottacheckout51
        i = Ibottasavingstar
        @k = [a,b,c,j]
        @t = [d,e,f,h,i]
        
        @store = params[:store]
    end
    
    def heb
        
    end
    
    def hyvee
    
    end
    
    def kroger
        
    end
    
    def meijer
        
    end
    
    def walmart
        
    end
    
end
