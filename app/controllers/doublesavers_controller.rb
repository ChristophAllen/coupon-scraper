class DoublesaversController < ApplicationController
    def save
        a = Krogercheckout51
        b = Krogertargetcoupon
        c = Krogersavingstar
        d = Checkout51targetcoupon
        e = Checkout51savingstar
        f = Targetcouponsavingstar
        g = Krogeribotta
        h = Ibottacheckout51
        i = Ibottasavingstar
        j = Targetibottum
        @k = [a,b,c,d,e,f,g,h,i,j]
        @k.each do |x|
            x.all.each do |y|
                Doublesaver.create(title1: y.title1, title2: y.title2, value1: y.value1, value2: y.value2, store1: y.store1, store2: y.store2, link1: y.link1, link2: y.link2, repeaters: y.repeaters, copies: y.copies, triplesave:false)    
            end
        end
        
        Triplesave.all.each do |x|
            Doublesaver.create(title1: x.title1, title2: x.title2, title3: x.title3, value1: x.value1, value2: x.value2, value3: x.value3, link1: x.link1, link2: x.link2, link3: x.link3, repeaters: x.repeaters, store1: x.store1, store2: x.store2, store3: x.store3, triplesave:true) 
        end
        @products = Doublesaver.all
    end

    def show
        a = Krogercheckout51
        b = Krogertargetcoupon
        c = Krogersavingstar
        d = Checkout51targetcoupon
        e = Checkout51savingstar
        f = Targetcouponsavingstar
        g = Krogeribotta
        h = Ibottacheckout51
        i = Ibottasavingstar
        j = Targetibottum
        @k = [a,b,c,d,e,f,g,h,i,j]
        @l = Triplesave.all
        @products = Doublesaver.all
    end

    def delete
        Doublesaver.delete_all
        @products = Doublesaver.all
    end
    
    def destroy
        Doublesaver.find(params[:id]).destroy
        redirect_to "https://rails-tutorial2-chriscma.c9users.io/doublesavers/show"
    end    
end
