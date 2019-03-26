class HomepageController < ApplicationController
    
    def stores
        
    end
    
    def delete_triple_repeats
            Triplesave.all.each do |x|
                arr_title_1 = []
                arr_title_1 += [x.title1, x.title2, x.title3]
                arr_store_1 = []
                arr_store_1 += [x.store1, x.store2, x.store3]
                z = 0                
                    Triplesave.all.each do |y|
                        arr_title_2 = []
                        arr_title_2 += [y.title1, y.title2, y.title3]
                        arr_store_2 = []
                        arr_store_2 += [y.store1, y.store2, y.store3]
                        storeCompare = arr_store_1 - arr_store_2
                        titleCompare = arr_title_1 - arr_title_2
                        if titleCompare.length == 0 && storeCompare.length == 0
                            z = z + 1
                        
                            if z > 1 
                                y.destroy
                            end
                    
                        end
                    end   
            end 
    end        
    
    def delete_double_repeats
        
        options1 = {
            1 => [Krogertargetcoupon, Kroger, Targetcoupon],
            2 => [Krogercheckout51, Kroger, Checkout51],
            3 => [Krogersavingstar, Kroger, Savingstar],
            4 => [Checkout51targetcoupon, Checkout51, Targetcoupon],
            5 => [Checkout51savingstar, Checkout51, Savingstar],
            6 => [Targetcouponsavingstar, Targetcoupon, Savingstar],
            7 => [Krogeribotta, Kroger, Ibotta],
            8 => [Ibottacheckout51, Ibotta, Checkout51],
            9 => [Ibottasavingstar, Ibotta, Savingstar],
            10 => [Targetibottum, Targetcoupon, Ibotta]
        }
        
        options1.each do |key,value|
            value[0].all.each do |x|
            z = 0                
                value[0].all.each do |y|
                    if y.title1 == x.title1 && y.title2 == x.title2 || y.title2 == x.title1 && y.title1 == x.title2
                        z = z + 1
                        
                        if z > 1 
                            y.destroy
                            x.update_attribute(:copies, z-1)
                        end
                    end
                end   
                
            end
            
        end
    end    
    

    def alltimesave
        options1 = {
            1 => [Krogertargetcoupon, Kroger, Targetcoupon],  # currently have HEB up (had Albertsons up in the latest run) 
            2 => [Krogercheckout51, Kroger, Checkout51],  
            3 => [Krogersavingstar, Kroger, Savingstar], 
            4 => [Checkout51targetcoupon, Checkout51, Targetcoupon], 
            5 => [Checkout51savingstar, Checkout51, Savingstar],
            6 => [Targetcouponsavingstar, Targetcoupon, Savingstar],
            # 7 => [Krogeribotta, Kroger, Ibotta], # these two don't go well together because iBotta is selective in its stores 
            8 => [Ibottacheckout51, Ibotta, Checkout51],
            9 => [Ibottasavingstar, Ibotta, Savingstar],
            10 => [Targetibottum, Targetcoupon, Ibotta]
        }
        
        options1.each do |key, value|
            
            @store1 = value[1].all
            @store2 = value[2].all
        
            @store1.each do |x|
                x_title_placeholder = x.title.gsub(/["\\","™",'™',"®","\'",".","\’","Ⓡ"]/, '' ).downcase.split(" ")
                x_title_placeholder = worddelete(x_title_placeholder, value[0])
                fake_x_title_placeholder = singularize(x_title_placeholder)

                @store2.each do |y|
                    y_title_placeholder = y.title.gsub(/["\\","™",'™',"®","\'",".","\’","Ⓡ"]/, '').downcase.split(" ")
                    fake_y_title_placeholder = singularize(y_title_placeholder)
                    
                    fake_z = fake_x_title_placeholder & fake_y_title_placeholder
                    z = x_title_placeholder & y_title_placeholder
                    
                    if fake_z.length >= 3 && x_title_placeholder.include?("krave") && y_title_placeholder.include?("krave")
                        value[0].create(title1: x.title, title2: y.title, value1: x.value, value2: y.value, link1: x.link, link2: y.link, repeaters: fake_z.join(" + "), store1: x.store, store2: y.store)
                    elsif fake_z.length >= 2 && x_title_placeholder.exclude?("krave") && y_title_placeholder.exclude?("krave")
                        value[0].create(title1: x.title, title2: y.title, value1: x.value, value2: y.value, link1: x.link, link2: y.link, repeaters: fake_z.join(" + "), store1: x.store, store2: y.store)
                    end
                end
            end
            delete_double_repeats()
        end

        triplesave()
        
        @a = Krogercheckout51.all 
        @b = Krogertargetcoupon.all 
        @c = Krogersavingstar.all
        @g = Krogeribotta.all
        @d = Checkout51targetcoupon.all
        @e = Checkout51savingstar.all
        @f = Targetcouponsavingstar.all
        @h = Ibottacheckout51.all
        @i = Ibottasavingstar.all
        @j = Targetibottum.all
        @k = Triplesave.all
    end
    
    # start by seeing if title 1 matches the first or second store on value[0]..then go from there 
    
    
    def triplesave
        options2 = {     # first one is the double matches that the second one gets compared too.  Third one is what gets passed through word delete 
            1 => [Krogertargetcoupon, Checkout51, Krogercheckout51, Checkout51targetcoupon, true], 
            2 => [Krogercheckout51, Ibotta, Krogeribotta, Ibottacheckout51, true],
            3 => [Krogersavingstar, Ibotta, Krogeribotta, Ibottasavingstar, true],
            4 => [Checkout51targetcoupon, Savingstar, Checkout51savingstar, true],
            5 => [Checkout51savingstar, Ibotta, Ibottacheckout51, Targetcouponsavingstar, false],  # need to fix
            6 => [Targetcouponsavingstar, Ibotta, Targetibottum, Ibottasavingstar, true],
            7 => [Krogeribotta, Targetcoupon, Krogertargetcoupon, Targetibottum, true],
            8 => [Ibottacheckout51, Targetcoupon, Targetibottum, Checkout51targetcoupon, false],  # need to fix
            9 => [Krogercheckout51, Savingstar, Krogersavingstar, Checkout51savingstar, true],
            10 => [Krogercheckout51, Savingstar, Krogersavingstar, Checkout51savingstar, true],
        }   
        
        options2.each do |keys, values| 
            store1 = values[0].all  # list of double matches for whichever store it is on in the options
            store2 = values[1].all  # list of all titles for the store that gets compared to the double match  
            
            store1.each do |x|
                x_title_placeholder = x.title1.gsub(/["\\","™","®"]/, '').downcase.split(" ")
                x_title_placeholder = worddelete(x_title_placeholder, values[2])   
            
                x_title2_placeholder = x.title2.gsub(/["\\","™","®"]/, '').downcase.split(" ")
                x_title2_placeholder = worddelete(x_title2_placeholder, values[3])
                
                store2.each do |y|
                    y_title_placeholder = y.title.gsub(/["\\","™","®"]/, '').downcase.split(" ")
                    
                    q = x_title2_placeholder & y_title_placeholder
                    z = x_title_placeholder & y_title_placeholder

                    if q.class == Array
                        w = q + z
                        if w.length >= 5 && z.length >= 2 && q.length >= 3
                            Triplesave.create(title1: x.title1, title2: x.title2, title3: y.title, value1: x.value1, value2: x.value2, value3: y.value, link1: x.link1, link2: x.link2, link3: y.link, repeaters: w.join(" + "), store1: x.store1, store2: x.store2, store3: y.store) 
                        end
                    end
    
                end
            end
        end
    end
    

    def delete_triple_repeats(array)
       triples = Triplesave.all
       triples.each do |x|
           if x.repeaters.split(" ") - array == 0
               return false
           end
       end
       return true
    end
    
    
    
    def toggle(task_id, bool)
        @task = Krogertargetcoupon.find_by_id(task_id)

        if @task != nil?
            @task.update_attributes(:completed => bool)
        else
            set_flash "Error, please try again"
        end
    end
    
    
    
    def singularize(title)
        j = 0
        
        title.length.times do
            title[j] = title[j].singularize
            j = j + 1
        end
        
        return title
    end
    
    
    
    
    
    def alltimeshow
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
    end
    
    
    
    
    
    def alltimedelete
        
        Krogercheckout51.delete_all
        Krogertargetcoupon.delete_all
        Krogersavingstar.delete_all
        Checkout51targetcoupon.delete_all
        Checkout51savingstar.delete_all
        Targetcouponsavingstar.delete_all
        Krogeribotta.delete_all
        Ibottacheckout51.delete_all
        Ibottasavingstar.delete_all
        Targetibottum.delete_all
        Triplesave.delete_all

        @a = Krogercheckout51.all
        @b = Krogertargetcoupon.all
        @c = Krogersavingstar.all
        @d = Checkout51targetcoupon.all
        @e = Checkout51savingstar.all
        @f = Targetcouponsavingstar.all
        @g = Krogeribotta.all
        @h = Ibottacheckout51.all
        @i = Ibottasavingstar.all
        @j = Targetibottum.all
        @k = Triplesave.all
        
    end
    
    

    
    def worddelete(title, stores)
        if stores == Krogertargetcoupon # 515
            krogertargetcoupondeletes = ["six", "(6)", "bella", "dry,", "variety", "at", "get,", "your", "dog", "any*", "lotion", "SAVE,", "Save", "save", "(exclude", "(excludes", "your", "sizes)", "off", "cottage", "doubles", "double", "cleaner", "masks", "schick", "gel", "travel", "sizes", "excludes", "egg", "laundry", "trial/travel", "can", "body", "bread", "frozen", "facial", "wipe", "wet", "towel", "baby", "90", "calorie", "pant", "(exclude", "conditioner", "loreal", "size)", "oiko", "to", "for", "package", "bath", "liquid", "white", "hammer", "bar", "5", "bag", "mix", "oz)", "trial", "size", "care", "higher)", "one", "hand", "/", "simple", "(4", "pouch", "detergent", "brand", "12", "cat", "18ct)", "nuts", "whole", "food", "best", "coffee", "bean", "box", "6", "ct", "4", "light", "fit", "drink", "30", "milk", "protein", "purchase", "bites", "on", "any", "ONE", "Save", "when", "you", "buy", "or", "(1)", "(2)", "(3)", "(4)", "(5)", "of", "two", "three", "four", "five", "in", "the", "boxes", "bars", "variety", "larger", "crunch", "cereal", "products", "oz", "flavor", "listed:", "product", "old", "and", "larger)", "refridgerated", "&", "oz.", "single", "serve", "organic", "yogurt", "cream", "cheese", "chips", "sliced"]
            fat_trimmed = title - krogertargetcoupondeletes
        elsif stores == Krogercheckout51 
            krogercheckout51deletes = ["lbs", "lbs.,", "diaper", "baking", "10", "probiotic", "probiotics", "stick", "sticks", "spinach", "mushroom", "mea", "chocolate", "11", "get", "lb", "scrubbing", "stand", "up", "cat", "+", "extra", "dry", "six", "varities", "men", "women", "men's", "women's", "get", "bella", "limited", "50", "26", "tablets", "tablet", "nutrition", "spread", "5-pack", "scents,", "scent", "cleanse", "cleanses", "lb", "lbs.", "100%", "variety.", "varieties", "12", "87", "variety", "variety.", "varities", "potato", "dip", "oscar", "single", "scent", "60", "17", "can", "lb", "in-wash", "cereals", "cereal", "cake", "natural", "cat", "dairy", "free", "alternative", "car", "clip", "vegetable", "blend", "del", "vent", "air", "refill", "care", "booster", "176", "wash", "liquid", "full", "honey", "16", "shave", "granola", "boxes", "filled", "butter", "pouch", "pouch.", "pouches", "pouches.", "protein", "bite", "almond", "select", "not", "9", "24", "powder", "crisp", "oil", "spray", "corn", "-", "sparkling", "cream", "sauces", "coffee", "mixes", "cheese", "bottles", "meals", "sizes", "pods", "collection", "bottle", "kit", "sauce", "size", "larger", "cash", "a", "box", "flavor/variety", "salty", "valid", "only", "sweet", "with", "one", "product", "bag", "mix", "light", "fit", "childrens", "bars", "20", "tissue", "packs", "products", "solution", "cleaning", "tea", "brand", "Save", "When", "you", "buy", "$100", "$200", "$300", "$400", "$500", "$025", "$050", "$150", "$1.00", "$2.00", "$3.00", "$4.00", "$5.00", "$0.25", "$0.50", "$1.50", "Items", "must", "appear", "on", "the", "same", "receipt.", "Any", "or", "any", "excludes", "and", "trial", "travel", "sizes.", "&", "1", "2", "3", "4", "5", "of", "ct.", "size.", "oz.", "(2)", "items", "ready", "to", "oz", "ct", "6", "8", "pack", "in", "for", "body", "hand", "by", "food", "snack", "bath", "organic", "bar", "children's", "serve", "toilet", "yogurt", "all", "other", "lip", "towels", "drops", "snacks", "frozen", "chicken", "dog", "cups", "paper", "razor", "nature", "relief", "products.", "ground", "turkey", "stain", "remover", "cleaner", "cold", "lotion", "cottage"]
            fat_trimmed = title - krogercheckout51deletes
        elsif stores == Krogersavingstar  
            krogersavingstardeletes = ["sauces", "chips", "nuts", "mixes", "sauce", "pods", "wash", "(3", "disposables", "disposablesauce", "meyer", "protein", "boxes", "free", "farm", "box", "bars", "count", "n", "chip", "$1000", "$10.00", "at", "use", "in", "price", "bag", "mix", "trial", "travel", "valid", "purchase", "product", "offer", "oz", "for", "ct", "light", "fit", "grains", "product.", "flavor/variety", "twin", "only", "fred", "yogurt", "all", "other", "not", "cheese", "flavor", "of", "peanut", "jar", "bowl", "$350", "$3.50", "time", "$125", "$1.25", "variety.", "size", "coffee", "excludes", "food", "75¢", "snacks", "larger", "oz.", "color", "dry", "When", "you", "buy", "Save", "&", "any", "variety", "size.", "on", "ONE", "(1)", "(2)", "(3)", "(4)", "(5)", "1", "2", "3", "4", "5", "one", "save", "$100", "$200", "$300", "$400", "$500", "$025", "$050", "$150", "$1.00", "$2.00", "$3.00", "$4.00", "$5.00", "$0.25", "$0.50", "$1.50", "when", "or", "and", "50¢", "two", "three", "$2000", "$20.00", "spend", "refrigerated", "listed:", "30¢", "good", "frozen", "soup", "can", "pasta", "bites", "package"]
            fat_trimmed = title - krogersavingstardeletes
        elsif stores == Checkout51targetcoupon 
            checkout51targetcoupondeletes =["chance", "win", "excludes", "exclude", "snack", "12", "24", "single", "serve", "cream", "cleansing", "body", "shave", "count", "can", "remover", "size", "kellogs", "kellog", "makeup", "dry", "protein", "10", "sizes.", "size.", "childrens", "children'ssizes", "wash", "washes", "Wash", "Washes", "children", "children's", "item", "one", "ones", "to", "brand", "cereal", "travel", "trial", "health", "8", "frozen", "back", "$500", "you", "for", "a", "not", "valid", "dressing", "del", "conditioner", "foods", "snacks", "boxes", "bags", "bars", "packs", "coffee", "ground", "salty", "food", "bag", "ct", "box", "6", "light", "fit", "organic", "products", "4", "pack", "Any", "any", "fresh", "variety", "Items", "must", "appear", "on", "the", "same", "receipt", "or", "larger.", "variety.", "Buy", "buy", "oz", "and", "of", "oz.", "larger", "purchase", "old", "&", "multipack", "ready", "bottle", "granola"]
            fat_trimmed = title - checkout51targetcoupondeletes
        elsif stores == Checkout51savingstar
            checkout51savingstardeletes =["products", "product", "bath", "big", "girl", "mix", "bags", "nature", "snacks", "foods", "refills", "plugins", "st", "disposables", "boxes", "pods", "bar", "salty", "back", "varities", "sizes", "one", "bag", "for", "you", "to", "product", "select", "sauce", "750", "ml", "food", "ct", "variety", "trial", "travel", "size", "with", "sweet", "body", "baking", "candy", "at", "$100", "$150", "$200", "$1.00", "$1.50", "$2.00", "light", "fit", "5", "larger", "of", "women", "packs", "multipacks", "saks.", "excludes", "tray", "pack", "items", "receipt.", "oz", "bars", "jar", "all", "other", "oz.", "valid", "only", "Any", "any", "fresh", "Items", "must", "appear", "on", "the", "same", "receipt", "or", "larger.", "variety.", "buy", "and", "&", "granola", "frozen"]
            fat_trimmed = title - checkout51savingstardeletes
        elsif stores == Targetcouponsavingstar # on this one 
            targetcouponsavingstardeletes =["mills", "mill", "Flu", "flu", "snacks", "by", "coffee", "box", "bite", "product", "food", "the", "light", "fit", "cup", "and", "from", "variety", "oz", "boxes", "bars", "flavor", "cheese", "oz.", "of", "package", "yogurt", "ultra", "sparkling", "on", "ONE", "TWO", "THREE", "FOUR", "FIVE", "any", "(1)", "(2)", "(3)", "(4)", "(5)", "when", "you", "buy", "one", "or", "listed:", "(excludes", "&", "two", "three", "four", "five", "good", "refrigerated"]
            fat_trimmed = title - targetcouponsavingstardeletes
        elsif stores == Krogeribotta
            krogeribottadeletes = ["sweet", "rice", "towel", "insoles", "drinks", "bird", "special", "milk", "almond", "broth", "3d", "powder", "extra", "olive", "stain", "disposables", "cloth", "mixes", "farm", "bath", "hair", "twin", "pack", "drink", "disposable", "razor", "mix", "conditioner", "white", "care", "product", "spray", "$200", "$2.00", "light", "fit", "childrens", "When", "you", "buy", "Save", "&", "any", "variety", "save", "$100", "$1.00", "or", "one", "$500", "$5.00", "with", "and", "1", "size", "food", "of", "ct.", "$300", "$400", "$150", "$250", "$3.00", "$4.00", "$1.50", "$2.50", "on", "low", "$125", "$1.25", "for", "in", "$2000", "$20.00", "the", "single", "to", "frozen", "butter", "organic", "-", "100%", "canned", "bars", "cereal", "chips", "cream", "sauce", "private", "wash", "cat", "dark", "oil", "baby", "coffee", "brew", "dog", "paper", "liquid", "yogurt", "baked", "sheets", "flu", "relief", "ready", "lotion", "pork", "water", "gluten", "free", "bags", "laundry", "$1000", "$10.00", "spend", "mucuc", "cough", "bar", "cottage", "infant", "sauces", "drops", "children's", "products", "microwave", "whitening", "crust", "balm", "moisturizing", "breast", "beans", "snacks", "crocker", "all", "purpose", "flavored", "cleaner", "remover", "sausage", "bites", "cookie", "protein", "facial", "detergent", "body", "sugar", "salad", "wings", "gel", "breakfast", "ground", "vinegar", "mac", "night", "big", "roll"] 
            fat_trimmed = title - krogeribottadeletes
        elsif stores == Ibottacheckout51
            ibottacheckout51deletes =["kids", "meals", "kid", "meal", "adult", "5", "ct", "-", "oz", "pet", "booster", "culturelle", "Culturelle", "blends", "Blend", "Blends", "cans", "can", "sparkling", "blend", "probiotic", "frosted", "sheets", "sheet", "clif", "bagged", "grilled", "oil", "Children's", "energy", "nutrition", "oscar", "spread", "children", "childrens", "health", "tissue", "spreads", "protein", "makeup", "extra", "children's,childrens", "salad", "broth", "dairy", "free", "the", "butter", "for", "at", "food", "sauces", "spray", "products", "soft", "foods", "cream", "sausage", "product", "oral", "mac", "powder", "skin", "in", "1", "chestal", "plain", "water", "$150", "$1.50", "flavored", "white", "disposable", "ice", "snack", "calorie", "on", "light", "fit", "of", "rich", "and", "bag", "size", "$100", "$200", "$300", "$400", "$500", "$050", "$1.00", "$2.00", "$3.00", "$4.00", "$5.00", "$0.50", "variety", "fresh", "with", "or", "&", "yogurt", "any", "cat", "dog", "pain", "shave", "sauce", "buy", "balm", "ready", "to", "remover", "heritage", "cottage", "brand", "organic", "frozenpaper", "turkey", "kit", "snacks", "lotion", "soap", "spices", "wash", "chicken", "cough", "frozen", "bars", "paper", "cloths", "cooked", "milk", "ct.", "pack", "baby", "drops", "single", "serve", "mix", "care", "bath", "honey"]
            fat_trimmed = title - ibottacheckout51deletes
        elsif stores == Ibottasavingstar
            ibottasavingstardeletes = ["by", "mills", "mill", "apple", "snacks", "mix", "candies", "rice", "box", "spray", "fragrance", "spices", "inspired", "girl", "soft", "family", "cream", "flavored", "chip", "chips", "$125", "$1.25", "one", "of", "baked", "good", "spend", "at", "bottle", "bottles", "farm", "$050", "$075", "$0.50", "$0.75", "sauce", "sauces", "disposable", "white", "wash", "$150", "$1.50", "product", "products", "$1000", "$10.00", "sam", "club", "calorie", "bar", "bars", "candy", "to", "baby", "light", "fit", "save", "on", "and", "variety", "frozen", "or", "$100", "$200", "$300", "$400", "$500", "$1.00", "$2.00", "$3.00", "$4.00", "$5.00", "&", "any", "foods", "food", "organic", "snack"]
            fat_trimmed = title - ibottasavingstardeletes
        elsif stores == Targetibottum
            targetibottumdeletes = ["cereals", "refrigerated", "foaming", "pizza", "cereal", "12", "oz", "cereal", "cinnamon", "dean", "k", "detergent", "baby", "liquid", "booster", "farm", "farms", "crunch", "nuts", "nut", "to", "dog", "Schick", "schick", "loreal", "L'Oreal", "wash", "1", "2", "ones.", "Ones.", "One.", "meal", "Paris", "paris", "pari", "snack", "snacks", "body", "Flu", "flu", "one", "by", "frozen", "dressing", "coffee", "protein", "food", "old", "el", "chocolate", "cinnamon ", "pack", "powder", "peanut", "the", "meat", "product", "products", "light", "fit", "on", "or", "&", "all", "crocker", "organic", "goods", "yogurt", "serve", "any", "and", "shell", "cream", "shells", "dinner", "bars", "chips"]
            fat_trimmed = title - targetibottumdeletes
        end
        return fat_trimmed
    end
    
    def singleshow
        @products = params[:store].capitalize.safe_constantize.all
        @store = params[:store].capitalize
    end

    def singledelete
        puts params[:store].capitalize
        params[:store].capitalize.safe_constantize.delete_all
        @store = params[:store].capitalize
        @products = params[:store].capitalize.safe_constantize.all
    end
    
    def destroy
        Triplesave.find(params[:id]).destroy
    end    
    
    def deleteall
        Albertson.delete_all
        Checkout51.delete_all
        Heb.delete_all
        Hyvee.delete_all
        Ibotta.delete_all
        Meijer.delete_all
        Savingstar.delete_all
        Smith2.delete_all
        Targetcoupon.delete_all
        Triplesave.delete_all
        Doublesaver.delete_all
        
        a = Albertson
        b = Checkout51
        c = Heb
        d = Hyvee
        e = Ibotta
        f = Meijer
        g = Savingstar
        h = Smith2
        i = Targetcoupon
        j = Triplesave
        k = Doublesaver
        @l = [a,b,c,d,e,f,g,h,i,j,k]
    end

end
