class Smith2Controller < ApplicationController
# When I hit 'Exp', the previous one is the title, and the previous previous to title is price. So if n = 4 is Exp, n = 3 is title, n = 1 is the price
#I could split the Exp line by split(" ") then take out Exp, day, days, left!, then take off the last element of that then join it again and do Expires + "new element"
#Pop removes the last one 
    def save
        @arr = text().split("\n")
        counter = 0
        @arr.length.times do
            if @arr[counter].split("").include?("T") && @arr[counter].split("").include?("o") && @arr[counter].split("").include?("d") && @arr[counter].split("").include?("a") && @arr[counter].split("").include?("y")
            
            elsif @arr[counter].split(" ").include?("Exp")
                exp_placeholder = @arr[counter].split(" ")
                exp_placeholder.delete("Exp")
                exp_placeholder.delete("day")
                exp_placeholder.delete("days")
                exp_placeholder.delete("left!")
                exp_placeholder.split("").pop
                exp_placeholder.split("").pop
                exp_placeholder = "Expires " + exp_placeholder.join("")
               Smith2.create(title: @arr[counter - 1], value: @arr[counter - 3] + " / " + exp_placeholder, total: 0, store: "Kroger", link: "https://www.kroger.com/cl/coupons/")
               Kroger.create(title: @arr[counter - 1], value: @arr[counter - 3] + " / " + exp_placeholder, total: 0, store: "Kroger", link: "https://www.kroger.com/cl/coupons/")
            end
            counter = counter + 1
        end
        @products = Smith2.all
    end
    
    def delete
        Smith2.delete_all
        # Kroger.delete_all
        @products = Smith2.all
    end
    
    def show
        @products = Smith2.all
    end
        
    def destroy
        Smith2.find(params[:id]).destroy
        redirect_to "https://rails-tutorial2-chriscma.c9users.io/homepage/singleshow/smith2"
    end
    
    def text
        t = "
        
Get 200 BONUS FUEL Points
TracFone
when you buy ONE (1) TRACFONE, SIMPLE MOBILE, TOTAL WIRELESS or NET 10 Prepaid Wireless Card.
Exp 03/05/2019

Sign In to Load
Qualifying Products


Get 200 BONUS FUEL Points
AT&T
when you buy ONE (1) AT&T Prepaid Wireless Card.
Exp 03/05/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

Save $5.00 on Candy with Your Pickup Purchase
Other
when you purchase $15.00 worth of candy. Offer valid only when you purchase using Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/092 days left!

Sign In to Load
Qualifying Products


Save $1.00 on 2
Big G
when you buy TWO (2) General Mills cereal listed: Cheerios™, Cinnamon Toast Crunch™, Lucky Charms™, Reese's Puffs, Chex™, Blasted Shreds™, Cocoa Puffs™, Trix™, Cookie Crisp™, Golden Grahams™, Kix™, Fiber One™, Wheaties™, Raisin Nut Bran, Total™, Basic 4™, Oatmeal Crisp™, Nature Valley™ cereal, Nature Valley™ Granola (pouches)
Exp 03/14/2019

Sign In to Load
Qualifying Products
Friday & Saturday Only!

$1.99
Store Brand
when you buy ONE (1) Kroger Butter (16 oz). Download the coupon from February 6-9 and redeem from February 8-9 ONLY. Use up to 5 times in a single transaction, while supplies last.
Exp 02/092 days left!

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Tostitos
when you buy ONE (1) Tostitos Tortilla Chips (10-13 oz) or Ruffles Potato Chips (8.5-9 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$2.99
Kroger Brand
when you buy ONE (1) Kroger Brand Cheese Shreds or Bars, 12-16 oz. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/092 days left!

Sign In to Load
Qualifying Products


Save $1.00 on 3
Pillsbury
when you buy THREE (3) Pillsbury™ Refrigerated Baked Goods Products, any variety or size
Exp 03/14/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Sara Lee
When you buy ONE (1) Sara Lee Bread (20 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Sign In to Load
Qualifying Products
5X Event

Save $1.00 on 3
Campbell's
When you buy THREE (3) Campbell's Condensed (10.5-11 oz) Excludes Chicken Noodle, Tomato, Cream of Chicken, Cream of Mushroom
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Store Brand
When you buy ONE (1) Kroger Sour Cream, Cottage Cheese or Dip, any variety (24 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Sargento
When you buy ONE(1) Sargento Slices (6.7 - 8 oz), Shredded Cheese (5 -8 oz), Snacks (9 -12 oz) and Balanced Breaks (3/1.5oz), any variety
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Cheez-it
When you buy ONE (1) Cheez-It crackers, any variety (7.5 - 12.4 OZ).
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Big G
When you buy ONE (1) Big G Cereal, select items
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $5.00 on Your Grocery Purchase
Happy Lady
when you buy ONE (1) HAPPY LADY Gift Card totaling $50.00 or more.
Exp 02/19/2019

Sign In to Load
Qualifying Products
4X Gift Card Event

Get 4X FUEL Points on Mastercard® or Visa® gift card
Other
When you buy a $25, $50, or $100 Mastercard® or Visa® gift card. *Excludes Variable Load Gift Cards. Restrictions Apply. See Store for Details. (Valid 2/8/19-2/10/19)
Exp 02/103 days left!

Sign In to Load
Qualifying Products
4X Gift Card Event

Get 4x FUEL POINTS
Other
when you buy a participating gift card* Restrictions Apply. See Store for Details.
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
PHILADELPHIA
When you buy ONE (1) PHILADELPHIA Cream Cheese 8oz Bricks
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Hellmann's
when you buy ONE (1) Hellman's Mayonnaise, any flavor (15-30 fl oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$1.99
Private Selection
when you buy ONE (1) Private Selection Gourmet Potatoes, 24 oz. size. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive Pickup coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/092 days left!

Sign In to Load
Qualifying Products
5X Event

Save $4.00 on 4
Coca-Cola
When you buy FOUR (4) Coca-Cola 6-Packs, any flavor variety
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 50¢ on 5
Yoplait
when you buy FIVE (5) Yoplait® Original, Light, Whips!®, OR Lactose Free Yogurt
Exp 03/14/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Coffee-Mate
when you buy any ONE (1) NESTLÉ® COFFEE MATE® Liquid Coffee Creamer (32 oz) Excluding natural bliss®
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Ore-Ida
When you buy ONE (1) Ore Ida Frozen Potatoes, any variety (14 -32oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $2.00 on 4
Garden Delight
When you buy FOUR (4) Ronzoni Garden Delight (12 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $2.00 on 4
Ronzoni
When you buy FOUR (4) Ronzoni Smart Taste (12 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Birds Eye
when you buy ONE (1) Birds Eye® Core, C&W Frozen Vegetable, Birds Eye® Steamfresh®, Chef's Favorite, Premium Select, Protein Blend, or Veggie Made™ Riced Cauliflower
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
Ocean Spray
when you buy ONE (1) Bottle of Ocean Spray® Pink Cranberry Juice Cocktail (64 oz.)
Exp 04/12/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Store Brand
When you buy ONE (1) Kroger Apple Juice, any variety (64 fl oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Marie Callender's
When you buy ONE (1) Marie Callender's® Bowls, Dinners, and/or Pot Pies (7-16 oz.) Exlcudes Family Size
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00 on 2
Nature Valley
when you buy TWO (2) Nature Valley™ Granola Bars, Nature Valley™ Biscuits, Nature Valley™ Granola Cups, Nature Valley™ Layered Granola Bars, Nature Valley™ Soft-Baked Filled Squares, Nature Valley™ Protein Bars OR Nature Valley™ Peanut or Almond Butter Granola Bites Pouch, any variety (5 COUNT OR LARGER)
Exp 03/14/2019

Sign In to Load
Qualifying Products
Wellness Your Way Savings

Save $1.00 on 2
Kellogg's
When you buy TWO (2) Kellogg's Raisin Bran® or Frosted Mini-Wheats® Cereals, any variety (13.5 oz. or Larger)
Exp 03/05/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Kellogg's
when you buy ONE (1) Kellogg's® Eggo® Waffles, any variety (8-10 ct) or Pancake Product, any variety
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Chips Ahoy!
When you buy ONE (1) CHIPS AHOY Cookies (7 - 13 oz.)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
I Can't Believe It's Not Butter
when you buy ONE (1) “I Can’t Believe it’s Not Butter” item, any flavor (8-15 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00 on 4
Kraft
When you buy FOUR (4) Kraft Mac and Cheese (5.5 to 7.25 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 50¢
Oikos
when you buy ONE (1) Dannon® Oikos® Triple Zero yogurt (5.3 oz)
Exp 04/01/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Breyers
When you buy ONE (1) Breyers (48 oz) or Breyers Delights Pint, any variety (48 fl oz / 16 fl oz).
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Ball Park
When you buy ONE (1) Ball Park Buns (12-14 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00 on 5
Chef Boyardee
When you buy FIVE (5) Chef Boyardee (7.25 oz or larger) and/or Snack Pack Puddings or Juicy Gels (4-pack or larger) any variety, mix or match
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Dannon
when you buy ONE (1) Dannon Activia or Danimals Yogurt, any variety (4 - 6ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Hillshire Farm
When you buy ONE (1) Hillshire Farm Smoked Sausage Rope or Links (12 -14 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Crest
when you buy ONE (1) participating Crest Complete, ProHealth or 3DWhite Toothpaste (3.3 oz or larger)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Nature Valley
When you buy ONE (1) Nature Valley Core Line Product, any variety
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.25 on 2
AllWhites
when you buy (2) AllWhites® Liquid Egg Whites Cartons (32oz.)
Exp 04/29/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$1.69
Kroger Brand
when you buy ONE (1) Kroger Brand Sliced Mushrooms, 8 oz tray. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/092 days left!

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Minute Maid
When you buy ONE (1) Minute Maid Fruit Drink or Ade, any variety (59 oz.)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Ben & Jerry's
When you buy ONE (1) Ben & Jerry's Pint or Ben & Jerry's Pint Slices, any variety (16 fl oz or 3ct).
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 55¢
Frigo
when you buy ONE (1) Frigo® Cheese Product, any variety or size
Exp 04/30/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Minute Maid
When you buy ONE (1) Minute Maid Carton Orange Juice, any variety (59 oz.)
Exp 02/19/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$1.99
Private Selection
when you buy ONE (1) Private Selection Salted French Butter. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/16/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$2.99
Kroger Brand
when you buy ONE (1) Kroger Brand Tri Color Peppers. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/16/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00 on 4
Totino's
When you buy FOUR (4) Totino's Bagged Pizza, any variety including Cheese, Pepperoni, Combination
Exp 02/19/2019

Sign In to Load
Qualifying Products
Lunar New Year Savings

Save 55¢
Kikkoman
When you buy ONE (1) Kikkoman® Product, any size or variety
Exp 03/02/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Gold Peak
When you buy ONE (1) Gold Peak Tea, any variety (52 oz.)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Oscar Mayer
when you buy ONE (1) Oscar Mayer Meat or Turkey Bologna and Cotto Salami (16 oz.).
Exp 02/19/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer


99¢
Private Selection
when you buy ONE (1) Private Selection Dry Pasta or Mac & Cheese Sauce. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive Pickup coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/092 days left!

Sign In to Load
Qualifying Products
5X Event

Save 20¢
Bush's
When you buy ONE (1) Bush's Variety (15-16 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Dawn
When you buy ONE (1) Dawn (19.4 oz or 16.2 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $2.00
Tide
when you buy ONE (1) Tide Liquid (92-100 oz) or Tide Pods/Gain Flings (32/42 ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.50
Maxwell House
When you buy ONE (1) Maxwell House or Yuban, any variety (22-32 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $2.00 on 4
Betty Crocker
When you buy FOUR (4) Betty Crocker Helper boxed family dinners, any variety (4.7-13.6oz)
Exp 03/05/2019

Sign In to Load
Qualifying Products


Save 25¢
Kleenex
when you buy ONE (1) box/pack of KLEENEX® Facial Tissue or KLEENEX® Wet Wipes. Not valid on travel/trial sizes.
Exp 02/125 days left!

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Healthy Choice
When you buy ONE (1) Healthy Choice® Power Bowls (Excludes Breakfast), Simply Steamers, Café Steamers and/or Complete Dinners
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
JM Smucker
when you buy ONE (1) Jif Peanut Butter mix (28 oz) or Smucker's Strawberry Jam (25-32 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Oscar Mayer
when you buy ONE (1) Oscar Mayer Beef Bologna and Cotto Salami (16 oz.).
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Store Brand
When you buy ONE (1) Kroger Oatmeal, any variety (8 - 12 ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products
Friday & Saturday Only!

$1.88
Eckrich
When you buy ONE (1) Eckrich Smoked Sausage, Select Varieties (8.3 - 14 oz). Download the coupon from February 6-9 and redeem from February 8-9 ONLY. Use up to 5 times in a single transaction, while supplies last.
Exp 02/092 days left!

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Malt-O-Meal
When you buy ONE (1) Malt-O-Meal bag cereal, any variety, (17 - 23.5 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 50¢
Kroger Brand
When you buy ONE (1) Bakery Fresh Goodness™ French or Garlic Bread
Exp 03/05/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Reynolds
When you buy ONE (1) Reynolds Aluminum Foil (75/50/35 or 37.5 SF)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Other
When you buy ONE (1) Black Label or Natural Choice Raw Bacon, any variety (12-16oz).
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
Arm & Hammer
when you buy ONE (1) ARM & HAMMER™ Liquid Laundry Detergent, any size.
Exp 02/23/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Pepperidge Farm
When you buy ONE (1) Pepperidge Farmhouse Bread or Pepperidge Farm Whole Grain
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Vlasic
When you buy ONE (1) Vlasic Pickles(16-32 ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$1.99
Bakers Chocolate
When you guy ONE (1) Baker's Premium Baking Bar (4oz). Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/16/2019

Sign In to Load
Qualifying Products


Save $1.50 on 2
Barilla
when you buy TWO (2) Barilla Collezione products
Exp 04/20/2019

Sign In to Load
Qualifying Products


Save 40¢
Lipton
when you buy ONE (1) Lipton Tea Bags, K-cup, Liquid or Powdered Iced Tea Mix product.
Exp 02/24/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
PAM
When you buy ONE (1) PAM (5-6 oz or larger). Excludes PAM Coconut
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00 on 2
Betty Crocker
When you buy TWO (2) Betty Crocker or Mott's Fruit Snacks, any variety (6-10 ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Capri Sun
When you buy ONE (1) Capri Sun any variety (60 oz). Excludes Capri Sun Organic and 100% Juice
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
I Can't Believe It's Not Butter
when you buy ONE (1) Brummel & Brown item (15 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Dasani
when you buy ONE (1) Dasani (24pk/ .5L)
Exp 02/19/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$1.29 per lb
Kroger Brand
when you buy ONE (1) Boneless Pork Loin. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/092 days left!

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Minute Maid
When you buy ONE (1) Minute Maid Light or Twist, any variety (52 oz.)
Exp 02/19/2019

Sign In to Load
Qualifying Products
Wellness Your Way Savings

Save 50¢
Quaker
when you buy ONE (1) Quaker® Old Fashioned Oats (18oz-42 oz)
Exp 03/05/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
V8
when you buy ONE (1) V8 Splash (64oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Kleenex
When you buy ONE (1) Kleenex Single Pack (50-160 ct.)
Exp 02/19/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$2.49
Hormel
when you buy ONE (1) HORMEL® PEPPERONI ® product. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/092 days left!

Sign In to Load
Qualifying Products
5X Event

Save 50¢ on 2
Mentos
when you buy TWO (2) Mentos rolls (1.3 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Other
When you buy ONE (1) Wish-Bone or Western Item
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
Arm & Hammer
when you buy ONE (1) ARM & HAMMER™ Power Paks Laundry Detergent, any size.
Exp 02/23/2019

Sign In to Load
Qualifying Products


Save 50¢
Hormel
when you buy ONE (1) HORMEL® NATURAL CHOICE® Deli Meat (4 oz. or larger)
Exp 03/28/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00 on 4
Chicken of the Sea
when you buy FOUR (4) Chicken of the Sea Chunk Light Tuna (5 oz), Chicken of the Sea Chuck White (5 oz),Chicken of the Sea Sardines(3.75 oz) or Chicken of the Sea Salmon Pouch (2.5 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 75¢
Larabar
when you buy ONE (1) LÄRABAR™ multipack OR LÄRABAR™ Truffles, any variety or size
Exp 03/14/2019

Sign In to Load
Qualifying Products
Wellness Your Way Savings

Save $1.00
Nature Made
when you buy ONE (1) Nature Made item, any variety or size.
Exp 03/05/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$1.29
Betty Crocker
when you buy ONE (1) Betty Crocker Cake Mix, select varieties. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive Pickup coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/15/2019

Sign In to Load
Qualifying Products


Save 50¢
Post
when you buy ONE (1) Post® Great Grains® cereal, any flavor variety or size.
Exp 02/18/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.50
Gevalia
When you buy ONE (1) Gevalia Bag or Pod, any variety (10-12oz / 6-12ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Pure Blends
when you buy ONE (1) Pure Blends item, any flavor (15 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$1.49
Private Selection
when you buy ONE (1) Private Selection Pasta Sauce, any variety. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive Pickup coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/16/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Softsoap
When you buy ONE (1) Softsoap Liquid Hand Soap Pumps or refills, any variety (7.5 - 56 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
Neosporin
when you buy ONE (1) NEOSPORIN (.26 to 6 oz.), or BAND-AID (1 - 120 ct.) Product, any variety
Exp 04/15/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Oscar Mayer
when you buy ONE (1) Oscar Mayer Econowell (14-16 oz.).
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $3.00 on 2
Suave
when you buy TWO (2) Suave Professionals Wash and Care products. Excludes 2 oz. trial and travel sizes and twin packs.
Exp 03/03/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Other
When you buy ONE (1) Laughing Cow Wedges 6oz, any variety
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Popsicle
When you buy ONE (1) Popsicle, any variety (18 -20 ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 50¢ on 2
Yoplait
when you buy TWO (2) Oui™ by Yoplait® French-style yogurt Jars, any variety or size
Exp 03/14/2019

Sign In to Load
Qualifying Products


Save 20¢
Store Brand
When you buy ONE (1) Kroger Soy Sauce or Hoisin Sauce, Any Variety, 10-15 fl oz
Exp 03/05/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Kroger Brand
When you buy ONE (1) Kroger Buttermilk Fields Dressing, any variety (16 oz.)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
Yoplait
when you buy ONE (1) Yoplait® Go-GURT®, any variety (16CT OR LARGER)
Exp 03/14/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$1.99
Welch's
when you buy ONE (1) Welch's Sparkling Juice (25.4 fl oz). Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/16/2019

Sign In to Load
Qualifying Products


Save $1.00
Vicks
when you buy ONE (1) Vicks Product. Excludes ZzzQuil, PURE Zzzs, VapoCOOL Drops and trial/travel size.
Exp 02/092 days left!

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Nathan's Famous
When you buy ONE (1) Nathan's Famous Beef Franks, any variety (10-14oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Magnum
When you buy ONE (1) Magnum 3ct Bar or Magnum Pint,any variety (14.8 fl oz) (3ct).
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00 on 2
Welch's
When you buy TWO (2) Welch's Sparkling Juice, any variety (25.4oz)
Exp 02/15/2019

Sign In to Load
Qualifying Products


Save $1.00 on 2
Jolly Rancher
When you buy TWO (2) Jolly Rancher Candy Jelly Hearts bags (11oz)
Exp 02/21/2019

Sign In to Load
Qualifying Products


Save 50¢
Huggies
when you buy ONE (1) package of HUGGIES® Wipes (48 ct. or higher)
Exp 02/16/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Tyson
When you buy ONE (1) Tyson Frozen Chicken Nuggets, Patties, or Tenders (25.5 - 32 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$1.99
Ghirardelli
when you buy ONE (1) participating Ghirardellii Brownie or Cookie Mix (12.25-19 oz). Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/16/2019

Sign In to Load
Qualifying Products


Save $1.00
Jones Dairy Farm
when you buy ONE (1) Jones Dairy Farm Canadian Bacon (6 oz. pkg).
Exp 03/15/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Oscar Mayer
when you buy ONE (1) Oscar Mayer Wallet Pack (8 oz.).
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Dixie
when you buy ONE (1) Dixie or Dixie Ultra Plate (44 - 90 ct) Excludes 48 ct
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Horizon
when you buy ONE (1) Horizon Organic Milk, any variety (64 fl oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 50¢
Kroger Brand
When you buy ONE (1) Bakery Fresh Goodness Fruit Pie, any variety (8 in). Use up to 5 times in a single transaction, while supplies last.
Exp 02/26/2019

Sign In to Load
Qualifying Products


Save $3.00 on 2
Febreze
when you buy TWO (2) Febreze Air OR Small Spaces Products. Excludes trial/travel size.
Exp 02/23/2019

Sign In to Load
Qualifying Products


Save 50¢
Hormel
when you buy ONE (1) HORMEL® NATURAL CHOICE® Bacon product
Exp 03/28/2019

Sign In to Load
Qualifying Products


Save $1.50
Mars
When you buy ONE (1) Mars M&M's or Mixed Miniatures Party Candy Bag, (38oz or larger). Offer can be used 5 times in a singlel transaction.
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Ziploc
when you buy ONE (1) Ziploc® brand Sandwich or Snack Bags (66-90 ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $2.00 on 5
SmartOnes
when you buy FIVE (5) SMART ONES Frozen Meals, any variety or size.
Exp 02/081 day left!

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

88¢
Store Brand
when you buy ONE (1) Kroger Brand Jar Gravy, 12 oz. size. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive Pickup coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/092 days left!

Sign In to Load
Qualifying Products


Save $1.00
Truvia
when you buy ONE (1) package of Truvia® Stevia Sweetener. Excludes 9.8oz Jar and 30 ct.
Exp 02/28/2019

Sign In to Load
Qualifying Products


Save $2.00
Christian Potier
When you buy ONE (1) Christian Potier Sauce, any variety ( 5.07 oz ) Offer can be redeemed unlimited times in a single transaction.
Exp 03/10/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.50
Mars
When you buy ONE (1) Mars M&M's or Mixed Miniatures Party Candy Bag, (38oz or larger)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Fiber One
When you buy ONE (1) Fiber One Core Line Product, any variety
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Kotex
when you buy ONE (1) U BY KOTEX Pads (12-44 ct.), Tampons (18-36 ct.), or Liners (40-129 ct.).
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 75¢
U by Kotex
when you buy ONE (1) U BY KOTEX Pads (12 - 44 ct.), Tampons (18 - 36 ct.), or Liners (40 - 129 ct.)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.25 on 4
Breakstones
when you buy FOUR (4) BREAKSTONE'S Cottage Doubles products, any variety or size
Exp 03/15/2019

Sign In to Load
Qualifying Products
5X Event

Save 80¢
Orville Redenbacher's
when you buy any ONE (1) Orville Redenbacher's Microwavalbe Popcorn, any variety (6 count/12 count mini)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
Oral-B
when you buy ONE (1) Oral-B Glide Manual Floss, Floss Picks, OR Interdentals. Excludes trial/travel size.
Exp 02/23/2019

Sign In to Load
Qualifying Products


Save 30¢
Yoplait
when you buy ONE (1) YQ by Yoplait™, any variety or size
Exp 03/14/2019

Sign In to Load
Qualifying Products


Save $1.00 on 2
Spam
when you buy TWO (2) SPAM® products (12 oz.)
Exp 04/30/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Spam
When you buy ONE (1) SPAM (12 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


$1.49
Club
when you buy ONE (1) Keebler Townhouse or Club Cracker (9.2-13.8oz). Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive Pickup coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/23/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

88¢
Kroger Brand
when you buy ONE (1) Kroger Brand Gummi Candy (7-10 oz). Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/23/2019

Sign In to Load
Qualifying Products


$3.99
Freschetta
when you buy ONE (1) Freschetta Pizza (20 - 31 oz). Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive Pickup coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/23/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$5.49
Nestle
when you buy ONE (1) Stouffer's Family Size Entrée (28-40 oz). Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/23/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.50
McCafe
When you buy ONE (1) McCafe Bag or Pod, any variety (12oz /12ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 75¢
Turkey Hill
when you buy ONE (1) Turkey Hill All Natural Ice Cream (48 oz.)
Exp 05/05/2019

Sign In to Load
Qualifying Products


Save $1.00
Private Selection
When you buy ONE (1) Private Selection Cookies (6 ct), Private Selection Fruit Pies (5 in), or Private Selection Brownies (4 ct), available in the Bakery. Limit 1 per transaction.
Exp 02/16/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Foster Farms
when you buy ONE (1) Foster Farm Frozen Corn Dogs, any variety (12-16 ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

49¢
Store Brand
when you buy ONE (1) Kroger Brand Stuffing Mixes. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive Pickup coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/092 days left!

Sign In to Load
Qualifying Products


Save $1.00 on 2
Cascadian Farm
when you buy TWO (2) Cascadian Farm™ products, any variety or size
Exp 03/14/2019

Sign In to Load
Qualifying Products


Save $1.00
Tabasco
When you buy ONE (1) TABASCO® Family of Flavors® product (5 oz. or larger)
Exp 03/14/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢ on 2
M&M'S
when you buy TWO (2) M&M's Tablets (3.8 oz or larger)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00 on 2
M&M'S
when you buy TWO (2) M&M'S® Chocolate Bars, any variety (3.8 - 4oz)
Exp 03/29/2019

Sign In to Load
Qualifying Products


Save $2.00
Mucinex
when you buy ONE (1) Mucinex® Product
Exp 03/31/2019

Sign In to Load
Qualifying Products


$4.49
TGI Fridays
when you buy ONE (1) TGI Fridays Snack Item (12oz-17.4oz). Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/23/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
TGI Fridays
When you buy ONE (1) T.G.I. Friday Appetizers, any variety (12-17.4 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Oscar Mayer
when you buy ONE (1) Oscar Mayer Rigid Ham (16 oz.).
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Hungry Man
when you buy ONE (1) Hungry-Man single serve dinner entrée, any variety
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Febreze
When you buy ONE (1) Febreze Air, any variety (8.8 oz) or Febreze Small Spaces Starter Kit, any variety (0.18 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
Finish
When you buy ONE (1) Finish™ Quantum Automatic Dish Detergent, any variety (12ct, 20ct, 36ct, 58ct, or 68ct)
Exp 03/09/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Crest
when you buy ONE (1) Participating Crest Scope, ProHealth or 3DWhite Mouthwash (excludes trial size)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Huggies
when you buy ONE (1) Huggies 1X RFT Wipes (56-64ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Private Selection
when you buy ONE (1) Private Selection Hummus, any variety (8-10 oz).
Exp 02/19/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$5.99
Palermo
when you buy ONE (1) Screamin' Sicilian Frozen Pizza. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/092 days left!

Sign In to Load
Qualifying Products
5X Event

Save $2.00
Bounce
when you buy ONE (1) Downy Liquid (83 -103oz); Downy Fresh Protect, Downy Unstopables or Gain Fireworks Scent Beads (14.8 oz) or Bounce Dryer Sheets (200 ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 75¢
Farm Rich
When you buy ONE (1) Farm Rich Product (13.6oz – 24oz).  Excludes meatballs.
Exp 03/06/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Clorox
When you buy ONE (1) Clorox Bleach (55-64 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 50¢
Post
when you buy ONE (1) Post® Hostess™ Honey Bun or Post® Hostess™ Donettes™ cereal, any size.
Exp 03/04/2019

Sign In to Load
Qualifying Products


Save 75¢
Wholly Guacamole
when you buy ONE (1) WHOLLY GUACAMOLE® product
Exp 03/09/2019

Sign In to Load
Qualifying Products
Lunar New Year Savings

Save $1.00
Mahatma
When you buy ONE (1) Mahatma® Jasmine Rice (2lb)
Exp 03/02/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$5.00
Kroger Brand
when you buy ONE (1) Kroger Brand 20 ct. Shrimp Tray. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/16/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Oral-B
when you buy ONE (1) Participating Oral B manual toothbrush
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.50
Mahatma
When you buy ONE (1) Mahatma White, Jasmine or Basmati rice (5 LB)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Private Selection
When you buy ONE (1) Private Selection Stone Fired Pizza, any variety (15.3 - 19.3 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Aussie
when you buy ONE (1) Aussie Shampoo, Conditioner or Styler (5.7 - 13.5 FO)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 55¢
Jimmy Dean
when you buy ONE (1) Jimmy Dean Simple Scrambles® Product
Exp 04/30/2019

Sign In to Load
Qualifying Products


Save $5.00
Crest
when you buy ONE (1) Crest 3D White Whitestrips: Glamorous White, 1 HR Express, Professional Effects, FlexFit, Gentle Routine, Monthly Whitening Boost, OR Vivid. Excludes Whitestrips with Light, Noticeably White and trial/travel size.
Exp 02/23/2019

Sign In to Load
Qualifying Products


Save 50¢
Muir Glen
When you buy ONE (1) Muir Glen Item, any size or variety
Exp 03/01/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Farm Rich
When you buy ONE (1) Farm Rich appetizer
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 75¢
Odom's Tennessee Pride
when you buy ONE (1) Odom's Tennessee Pride® Frozen Breakfast Sandwiches, any variety (10 ct or larger)
Exp 02/20/2019

Sign In to Load
Qualifying Products


Save $1.00
Newman's Own
when you buy ONE (1) Newman's Own® Thin & Crispy Pizza, any size
Exp 03/31/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Trident
When you buy ONE (1) Trident Gum Bottle (40-50 ct.)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $2.00 on 4
Prince
When you buy FOUR (4) Prince Pasta (12 oz or Larger)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Oral-B
when you buy ONE (1) Participating Oral B or Glide Taped Floss or Floss Picks
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
Milton's
when you buy ONE (1) Milton's Organic Crackers, any variety (6 oz).
Exp 03/31/2019

Sign In to Load
Qualifying Products


Save 50¢
Degree
when you buy ONE (1) Degree Women Deodorant Wipes, Dry Spray Antiperspirant or Clinical Protection. Excludes twin packs and trial and travel sizes.
Exp 03/02/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Gold Peak
when you buy ONE (1) Gold Peak 6pk .5L
Exp 02/19/2019

Sign In to Load
Qualifying Products


$4.49
Delimex
when you buy ONE (1) Delimex Snack Item. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/23/2019

Sign In to Load
Qualifying Products


Save $3.00
Carol's Daughter
when you buy ONE (1) Carol's Daughter Hair Care or Body Care Product. Excludes all 2.0 oz trial sizes.
Exp 04/10/2019

Sign In to Load
Qualifying Products


Save $2.00
Nicorette
off any ONE (1) Nicorette 20ct Gum or Lozenge
Exp 04/30/2019

Sign In to Load
Qualifying Products
5X Event

Save $3.00
Huggies
when you buy ONE (1) Huggies Big Pack Diapers (42-112 ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00 on 2
Friskies
when you buy TWO (2) Friskies® brand Wet Cat food, any variety (12 count variety packs)
Exp 03/08/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Banquet
When you buy ONE (1) Banquet® MEGA Pot Pies
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
Air Wick
when you buy ONE (1) Air Wick Scented Oils Refill (2 ct.), Auto Spray Refill (1 ct.), or Essential Mist Refill (1 ct.)
Exp 04/05/2019

Sign In to Load
Qualifying Products


Free with Purchase
Russell Stover
Buy ONE (1) Russell Stover or Whitman's Candy Heart Box, (5.65 - 14 oz.), Get ONE (1) Russell Stover or Whitman's Candy Heart Box, (4-7 oz.) FREE
Exp 02/14/2019

Sign In to Load
Qualifying Products
5X Event

Save $2.00
Monster
When you buy ONE (1) Monster 4 Pack, any variety (4/16oz).
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Gatorade
When you buy ONE (1) Gatorade, G2, or G Zero (18pk /12oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products




Sign In to Load
Qualifying Products
5X Event

Save $1.50
Schick
When you buy ONE (1) Xtreme, ST, Quattro, Hydro or Hydro Silk Disposables
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Edge
When you buy ONE (1) Edge or Skintimate, any variety. Excludes 2.75 oz trial size
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 50¢
Oikos
when you buy ONE (1) Oikos® Oh! Double Cream yogurt (5.3 oz)
Exp 04/13/2019

Sign In to Load
Qualifying Products


Save $2.00
Garnier
when you buy ONE (1) Garnier® Nutrisse or Olia haircolor product
Exp 03/02/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Burt's Bees
when you buy ONE (1) participating Burt's Bees Toothpaste (4.2 oz or larger)
Exp 02/19/2019

Sign In to Load
Qualifying Products
Wellness Your Way Savings

Save $1.50
Advil
When you buy ONE (1) Advil Sinus Congestion, Advil Multi-Symptom or Alavert Product, any variety (20-24ct)
Exp 03/05/2019

Sign In to Load
Qualifying Products


Save $1.00
Kroger Brand
When you buy ONE (1) Bakery Fresh Goodness 8x8 Brownie, available in the Bakery. Limit 1 per transaction.
Exp 02/125 days left!

Sign In to Load
Qualifying Products


Save $2.00 on 20
Fancy Feast
when you buy TWENTY (20) cans of Purina® Fancy Feast® Medleys wet cat food, any variety or size.
Exp 02/28/2019

Sign In to Load
Qualifying Products
Wellness Your Way Savings

Save $2.00
Metamucil
when you buy ONE (1) Metamucil Fiber Supplement Product, any variety (114 Dose or 57 Dose)
Exp 03/05/2019

Sign In to Load
Qualifying Products


Save $5.00
K-Y
when you buy ONE (1) K-Y® Yours + Mine® Couples Lubricant®, K-Y® Intense® Pleasure Gel, or K-Y® Love, any size.
Exp 03/24/2019

Sign In to Load
Qualifying Products


Save $1.00
Dove
when you buy ONE (1) Dove Exfoliating Body Polish (10.5 oz.). Excludes trial and travel sizes.
Exp 02/103 days left!

Sign In to Load
Qualifying Products


Save $1.00
Nexxus
when you buy ONE (1) Nexxus Between Washes product. Excludes trial and travel sizes.
Exp 02/092 days left!

Sign In to Load
Qualifying Products


Save $3.00
Florastor
when you buy ONE (1) FLORASTOR® Product. Excluding 100-count.
Exp 03/31/2019

Sign In to Load
Qualifying Products


Save $15.00
Nicorette
when you buy ONE (1) Nicorette (72ct or larger) or NicoDerm CQ (14ct or Larger)
Exp 03/09/2019

Sign In to Load
Qualifying Products
Wellness Your Way Savings

Save $1.00
Bayer
When you buy ONE (1) Bayer Aspirin, any variety (100ct or larger)
Exp 03/05/2019

Sign In to Load
Qualifying Products


Save $4.00 on 2
Nivea
when you buy TWO (2) NIVEA® Body Lotion, In-Shower Body Lotion, or Creme Products. Excludes Trial Sizes.
Exp 03/03/2019

Sign In to Load
Qualifying Products


Save $1.00 on 2
Dinty Moore
when you buy TWO (2) DINTY MOORE® products
Exp 03/28/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Hellmann's
when you buy ONE (1) Hellman's Ketchup, any flavor (20 fl oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
Wellness Your Way Savings

Save $1.75
Store Brand
When you buy ONE (1) Kroger Brand GentleLAX Powder, any variety or size
Exp 03/05/2019

Sign In to Load
Qualifying Products


Save $1.00
Clearasil
when you buy ONE (1) CLEARASIL ACNE PRODUCT, any variety or size
Exp 02/23/2019

Sign In to Load
Qualifying Products


Save $3.00
Prilosec OTC
when you buy ONE (1) Prilosec OTC Product (28ct or larger).
Exp 02/23/2019

Sign In to Load
Qualifying Products


Save $1.00 on 2
Panda Express
When you buy TWO (2) Panda Express Sauces, any size or variety
Exp 03/02/2019

Sign In to Load
Qualifying Products


Save 50¢
Nature Valley
when you buy ONE (1) Nature Valley™ Crunchy Granola Snack Mix, any variety or size
Exp 03/14/2019

Sign In to Load
Qualifying Products


Save 50¢
Light & Fit
when you buy ONE (1) Two Good™ Greek lowfat yogurt (5.3oz single serve)
Exp 03/15/2019

Sign In to Load
Qualifying Products
ClickList Only Offer

Save $3.00 on Your Pickup Purchase
Keebler
when you buy THREE (3) participating Kellogg's, Keebler, or Kashi items. Offer valid only when you purchase using Pickup. Exclusive Pickup coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/16/2019

Sign In to Load
Qualifying Products


Save $2.00
AT&T
when you buy ONE (1) AT&T Prepaid Wireless Card.
Exp 03/05/2019

Sign In to Load
Qualifying Products


Save $2.00
Hershey's
Save $2.00 on Hershey's Pot of Gold Candy Heart Box, any variety (8.9oz ) when you spend $14.99 in the Floral Dept
Exp 02/15/2019

Sign In to Load
Qualifying Products


Save $1.50
Lubriderm
when you buy ONE (1) LUBRIDERM® Product, any variety (13 fl. Oz. or larger)
Exp 03/02/2019

Sign In to Load
Qualifying Products


Save $3.00
Phillips'
when you buy ONE (1) Phillips'® Fiber Good Gummies, any size.
Exp 03/03/2019

Sign In to Load
Qualifying Products


Save $3.00
Folgers
When you buy ONE (1) Folgers K-Cups (36 ct.) or Dunkin Donuts K-Cups (32 ct.), any variety
Exp 03/04/2019

Sign In to Load
Qualifying Products


Save $1.50 on 30
Fancy Feast
when you buy THIRTY (30) cans of Purina® Fancy Feast® wet cat food, any variety or size.
Exp 02/28/2019

Sign In to Load
Qualifying Products


Save $3.00 on 2
Ban
when you buy TWO (2) Ban® Roll-On product, any variety. Excludes 1.5 oz.
Exp 02/24/2019

Sign In to Load
Qualifying Products


Save $1.00
HERDEZ
When you buy ONE (1) Herdez Taqueria Street Sauce, any size or variety
Exp 03/02/2019

Sign In to Load
Qualifying Products


Save $7.00 on 2
Airborne
when you buy TWO (2) Airborne Products, any variety or size.
Exp 03/31/2019

Sign In to Load
Qualifying Products


Save $2.00
Crest
when you buy ONE (1) Crest Gum Detoxify OR Gum & Enamel Repair (3 oz or larger). Excludes all other variants, Kids and trial/travel size.
Exp 02/23/2019

Sign In to Load
Qualifying Products


Save $1.50
So Delicious Dairy Free
when you buy ONE (1) So Delicious Dairy Free Frozen Mousse, any size.
Exp 05/04/2019

Sign In to Load
Qualifying Products


Save $5.00 on 2
Enfagrow
When you buy TWO (2) Enfagrow Powders, any variety (20oz or larger)
Exp 02/15/2019

Sign In to Load
Qualifying Products
ClickList Only Offer

Free with Purchase
Blue Buffalo
when you buy ONE (1) bag of BLUE dry cat food (4.5-lb. or larger). Offer valid only when you purchase using Grocery Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/24/2019

Sign In to Load
Qualifying Products
5X Event

Save $3.00
Schick
When you buy ONE (1) Hydro, Hydro Silk, Quattro Titanium, Quattro for Women or Intuition Razor or Refill
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
Ling Ling Asian Kitchen
when you buy ONE (1) Ling Ling® Frozen Ramen Bowl, any size.
Exp 03/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.50
Colavita
When you buy ONE (1) Colavita Olive Oil, any variety (25.5 fl oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $2.00
TracFone
when you buy ONE (1) TRACFONE, SIMPLE MOBILE, TOTAL WIRELESS or NET 10 Prepaid Wireless Card.
Exp 03/05/2019

Sign In to Load
Qualifying Products


Save $2.00
Purina
when you buy ONE (1) bag of Purina® Cat Chow® brand dry cat food, any variety (13lb or larger)
Exp 02/26/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$2.99
Boboli
when you buy ONE (1) Boboli Pizza Crust (10-14 oz.). Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/092 days left!

Sign In to Load
Qualifying Products


Save $1.50 on 2
Clorox
when you buy TWO (2) Clorox® Scentiva® Products, any scent.
Exp 03/30/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$5.49
Kraft
when you buy ONE (1) O That's Good! Pizza. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/092 days left!

Sign In to Load
Qualifying Products


Save $1.00
SeaPak
When you buy ONE (1) SeaPak Beer Battered Shrimp
Exp 03/05/2019

Sign In to Load
Qualifying Products


Save $1.00
Ling Ling Asian Kitchen
when you buy any ONE (1) Ling Ling® Ramen Bowl
Exp 03/20/2019

Sign In to Load
Qualifying Products
Lunar New Year Savings

Save $4.00
Green Peacock
When you buy ONE (1) Green Peacock Basmati Rice (20lb)
Exp 03/02/2019

Sign In to Load
Qualifying Products


Save $1.00
Huggies
when you buy ONE (1) package of HUGGIES® Diapers. Not valid on 9 ct. or less.
Exp 02/16/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
GE
When you buy ONE (1) GE Basic LED Light Bulb
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $2.00
4 Way
when you buy ONE (1) 4 Way Fast Acting Nasal Spray, any size.
Exp 03/03/2019

Sign In to Load
Qualifying Products


Save $1.00
Prilosec OTC
when you buy ONE (1) Prilosec OTC Product (14 ct).
Exp 02/23/2019

Sign In to Load
Qualifying Products


Save $1.00 on 2
Revlon
When you buy TWO (2) Revlon Beauty Tools, any variety (includes tweezers, eyelash curlers, nail files, and nail clippers)
Exp 03/02/2019

Sign In to Load
Qualifying Products
Wellness Your Way Savings

Save $1.00 on 2
Kashi
When you buy TWO (2) Kashi® Organic cereals, any variety (9.5 oz. - 16.3 oz) Excludes Kashi by Kids.
Exp 03/05/2019

Sign In to Load
Qualifying Products


Save $2.00
Optimum Nutrition
When you buy ONE (1) Optimum Nutrition Protein Cake Bite 4 pack (8.89 oz.) or Protein Crisp 4 pack (8.04 oz.), any variety
Exp 02/27/2019

Sign In to Load
Qualifying Products


Save 75¢
HERDEZ
When you buy ONE (1) Herdez Refrigerated Salsa (15oz) or Guacamole (7oz), any variety
Exp 02/23/2019

Sign In to Load
Qualifying Products


Save 50¢
Protein One
when you buy ONE (1) Protein One™ 90 Calorie Bars, any variety or size
Exp 03/14/2019

Sign In to Load
Qualifying Products


Save $1.00 on 24
Friskies
when you buy TWENTY-FOUR (24) cans of Friskies® brand Wet Cat food, any variety (5.5 oz)
Exp 03/08/2019

Sign In to Load
Qualifying Products
5X Event

Save $3.00
Centrum
when you buy ONE (1) Centrum or Centrum Silver (200ct or larger) or Emergen-C (60 ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
Mamma Chia
When you buy ONE (1) Mamma Chia Vitality Beverage, any variety, or Squeeze (4pk), any variety
Exp 02/092 days left!

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$9.99
Bakery Fresh Goodness
when you buy ONE (1) participating Bakery Fresh Goodness Double Layer Cake. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/16/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

Save $1.00
Easy for you!
when you buy ONE (1) participating Easy for You Seafood. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/16/2019

Sign In to Load
Qualifying Products


Save $1.00
Ancient Harvest
When you buy ONE (1) Ancient Harvest Product, any size or variety
Exp 02/28/2019

Sign In to Load
Qualifying Products


Save $1.00
EPIC
when you buy ONE (1) EPIC® Bar, any size. Excludes EPIC® Performance Bars.
Exp 03/14/2019

Sign In to Load
Qualifying Products


Save $1.00 on 2
Liberte
when you buy TWO (2) Liberté® organic yogurt cups, any variety or size
Exp 03/14/2019

Sign In to Load
Qualifying Products


Save $2.00 on 2
Tres Latin Foods
When you buy TWO (2) Tres Latin Pupusas or Mini Pupusas, any variety
Exp 03/15/2019

Sign In to Load
Qualifying Products


Save $1.00
Arm & Hammer
when you buy ONE (1) ARM & HAMMER™ In-Wash Scent Booster, any variety or size.
Exp 02/23/2019

Sign In to Load
Qualifying Products


Save $1.50 on 2
Turkey Hill
when you buy TWO (2) Turkey Hill Decadent Delights Novelties (9.12 oz. Bars or 21 oz. Parfaits)
Exp 05/05/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
GE
When you buy ONE (1) GE Classic Shape LED Light Bulb
Exp 02/19/2019

Sign In to Load
Qualifying Products
Wellness Your Way Savings

Save $1.00
Vicks
When you buy ONE (1) Sinex Spray, Liquid, or Liquicap, any variety or size
Exp 03/05/2019

Sign In to Load
Qualifying Products


Save $3.00
Schick
When you buy ONE (1) Schick® Disposable Razors pack, any size or variety (excludes 1ct and Slim Twin® 2ct and 6ct)
Exp 02/16/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.50
Stacy's
When you buy ONE (1) Stacy's (18 oz) or Organic Pita Chip
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $3.00 on 3
Enfamil
When you buy THREE (3) Enfamil or Enfagrow Liquids, any variety (32 fl oz. or larger)
Exp 03/17/2019

Sign In to Load
Qualifying Products


Save $10.00
NicoDerm
off any ONE (1) Nicorette product 72-110ct or NicordermCQ 14ct
Exp 04/30/2019

Sign In to Load
Qualifying Products


Save $1.00
ZICO
When you buy ONE (1) ZICO® Coco-lixir, any variety (12oz), or ZICO® Chilled Natural Organic Coconut Water (13.5oz or larger)
Exp 02/15/2019

Sign In to Load
Qualifying Products


Save 75¢
Organic Valley
When you buy ONE (1) Organic Valley Flavored Half & Half, any variety or size
Exp 04/15/2019

Sign In to Load
Qualifying Products


Save $1.00 on 2
Kellogg's
when you buy TWO (2) Kellogg's® Special K® Pastry Crisps, Any Flavor, Mix or Match (12 ct. or Larger)
Exp 02/21/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Other
When you buy ONE (1) Laughing Cow Dippers 5ct, any variety
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
Friskies
when you buy ONE (1) Friskies® brand Wet Cat food, any variety (24 count variety pack)
Exp 03/08/2019

Sign In to Load
Qualifying Products


Save $1.00
House of Tsang
When you buy ONE (1) House of Tsang item, any size or variety
Exp 02/16/2019

Sign In to Load
Qualifying Products


Save $2.00 on 2
Revlon
When you buy TWO (2) Revlon Colorstay Foundation, Powder, or Concealer, any variety
Exp 03/02/2019

Sign In to Load
Qualifying Products


Save $3.00
Muscle Milk
when you buy ONE (1) MUSCLE MILK® Protein Powder (1.65lb or larger)
Exp 04/18/2019

Sign In to Load
Qualifying Products


Save $2.00
Biofreeze
when you buy ONE (1) Biofreeze Product. Excluding 10 and 16 ct. Packettes.
Exp 02/28/2019

Sign In to Load
Qualifying Products


Save $1.50
Coombs Family Farms
When you buy ONE (1) Coombs Family Farms Maple Syrup, any size or variety
Exp 03/31/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

Save $4.00
BLOOM HAUS
when you purchase at least $20.00 of participating Bloom Haus Bouquets. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/15/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Pine-Sol
When you buy ONE (1) Pine-Sol (24-28 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
Bhakti
When you buy ONE (1) Bhakti Iced Chai, any variety or size
Exp 03/31/2019

Sign In to Load
Qualifying Products
5X Event

Save $2.00
McCafe
When you buy ONE (1) McCafe Can, any variety (30 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $5.00 on 3
PediaSure
when you buy THREE (3) PediaSure® multi-pack shakes, any variety or size
Exp 03/16/2019

Sign In to Load
Qualifying Products
5X Event

Save $3.00 on 2
Pantene
when you buy TWO (2) Pantene Shampoo, Conditioner or 2N1 (24 - 25.4 FO)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $5.00
Nexium
when you buy ONE (1) Nexium® 24HR (28ct or larger)
Exp 03/02/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$2.99
Kroger Brand
when you buy ONE (1) Kroger Brand Bacon Wrapped Filet. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive Pickup coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/16/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Pepperidge Farm
When you buy ONE (1) Pepperidge Farm Multipacks, any variety (8-10 ct / 6.75-9.5oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Energizer
When you buy ONE(1) Energizer MAX Battery AA/AAA (8 ct), C/D (2 ct), 9V (1 ct) or Ult Lith AA/AAA (4 ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
Tresemme
when you buy ONE (1) TRESemme Between Washes product. Excludes trial and travel sizes.
Exp 02/103 days left!

Sign In to Load
Qualifying Products
5X Event

Save $1.00
BOOMCHICKAPOP
when you buy ONE (1) Angie's BOOMCHICKAPOP Microwavable popcorn, any flavor
Exp 02/19/2019

Sign In to Load
Qualifying Products
Friday & Saturday Only!

$4.99
Rubbermaid
when you buy ONE (1) Rubbermaid Easy Find Lids 18pc Boxed Set. Download the coupon from February 6-9 and redeem from February 8-9 ONLY. Use up to 5 times in a single transaction, while supplies last. Limited to stock on hand, selection varies. One Coupon Per Household.
Exp 02/092 days left!

Sign In to Load
Qualifying Products


Save $1.00
L'Oreal
when you buy ONE (1) L'Oreal Paris Magic Root Cover Up spray, any size.
Exp 03/12/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$2.99
Prego
when you buy ONE (1) Prego Farmers' Market® Sauce. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/092 days left!

Sign In to Load
Qualifying Products


Save 50¢
Betty Crocker
When you buy ONE (1) Betty Crocker Bottle Décor, any variety (1.25 oz. - 2.25 oz.)
Exp 02/23/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Scrubbing Bubbles
When you buy ONE (1) Scrubbing Bubbles Trigger (or) Scrubbing Bubbles Toilet Gel
Exp 02/19/2019

Sign In to Load
Qualifying Products
ClickList Only Offer

FREE Pickup with Purchase of Participating Items
SCOTT
when you buy FOUR (4) Cottonelle Bath Tissue 6ct Mega Roll, Viva Towels 6ct Big Rolls, Kleenex Tissues 4pk, or Scott 1000 8pk Bath Tissue. Offer valid only when you purchase using Pickup. Exclusive coupons valid for curbside pickup only. Not valid on delivery orders.
Exp 02/16/2019

Sign In to Load
Qualifying Products


Save $3.00
Ancient Nutrition
when you buy ONE (1) Ancient Nutrition Product, any variety or size
Exp 04/30/2019

Sign In to Load
Qualifying Products


Save $1.00
Lipton
when you buy ONE (1) Lipton Tea Herbal Supplement Wellness, any variety or size.
Exp 03/05/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Giovanni Rana
when you buy ONE (1) Rana Sauce, Totelloni, or Ravioli
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $2.00
Cascade
when you buy ONE (1) Cascade Action Pacs (36-60 ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $2.00
Glade
when you buy ONE (1) Glade Car Starter Unit
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Delimex
When you buy ONE (1) Delimex Mexican Appetizers, any variety (21.6 - 24oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 25¢
Vicks
when you buy ONE (1) Vicks VapoCOOL Drops Product. Excludes trial/travel size.
Exp 02/092 days left!

Sign In to Load
Qualifying Products


Save $1.00
Cepacol
when you buy ONE (1) Cepacol® Product, any size.
Exp 03/31/2019

Sign In to Load
Qualifying Products


Save 75¢
Progresso
when you buy ONE (1) Progresso™ Organic Soup Can, any size
Exp 03/14/2019

Sign In to Load
Qualifying Products


Save $1.00
O'Dang Hummus
When you buy ONE (1) O'Dang Hummus Dressing, any size or variety
Exp 03/02/2019

Sign In to Load
Qualifying Products


Save 20%
Kroger Brand
When you buy ONE (1) Iris 10 Stem Bunch.
Exp 02/28/2019

Sign In to Load
Qualifying Products


Save $1.00
Purina
when you buy ONE (1) bag of Purina® Cat Chow® brand dry cat food, any variety (3.15lb or larger)
Exp 02/26/2019

Sign In to Load
Qualifying Products


Save $10.00
Other
when you buy ONE (1) BUILD A BEAR Gift Card totaling $50.00 or more.
Exp 02/16/2019

Sign In to Load
Qualifying Products


Save 50¢
Kroger Brand
When you buy ONE (1) Bakery Fresh Goodness Paczki (4ct), available in the Bakery. Limit 1 per transaction.
Exp 02/26/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$8.99
Kroger Brand
when you buy ONE (1) Kroger Brand Crunchy Butterfly Shrimp, 2 lb. size. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/16/2019

Sign In to Load
Qualifying Products


Save 50¢
S&B Foods
When you buy ONE (1) S&B Golden Curry Medium Hot
Exp 02/28/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$1.99
Dolci Frutta
when you buy ONE (1) participating Saco Dolci Frutta Chocolate (8 oz). Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/16/2019

Sign In to Load
Qualifying Products
5X Event

Save $3.00 on 2
Herbal Essences
when you buy TWO (2) Herbal Essences Shampoo, Conditioner (33.8 FO)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Glade
when you buy ONE (1) Glade Auto Spray refill
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.50
Maxwell House
When you buy ONE (1) Maxwell House or Yuban Pod, any variety (12 ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Oscar Mayer
When you buy ONE (1) Oscar Mayer Snacks, any variety (7.75-9 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
Saffron Road
When you buy ONE (1) Saffron Road Product, any variety or size
Exp 04/12/2019

Sign In to Load
Qualifying Products


Save $15.00
Oral-B
when you buy ONE (1) Oral-B 5000 OR 6000 Rechargeable Electric Toothbrush, any size.
Exp 02/23/2019

Sign In to Load
Qualifying Products


Save $2.00
SeaPak
When you buy ONE (1) SeaPak Shrimp Taquitos
Exp 04/02/2019

Sign In to Load
Qualifying Products


Save 50¢
Food Should Taste Good
when you buy ONE (1) Food Should Taste Good™ Tortilla Chips OR Bean Chips, any variety (5.5 OZ OR LARGER)
Exp 03/14/2019

Sign In to Load
Qualifying Products


Save $5.00
Gerber
when you buy ONE (1) Gerber® Formula, any size.
Exp 03/31/2019

Sign In to Load
Qualifying Products


Save $1.00
MorningStar Farms
When you buy ONE (1) MorningStar Farms® Product, any size or variety
Exp 02/092 days left!

Sign In to Load
Qualifying Products


Save 25¢
Other
when you buy ONE (1) Holiday Home Baking Accessory. Redeem 2/6 to 2/12; Coupon can be used one time, Limit to stock on hand; Selection Varies; One Coupon Per Household
Exp 02/125 days left!

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Kuner's
When you buy ONE (1) Kuners Vegetables any variety (14.5 -15 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Glade
when you buy ONE (1) Glade Candle (3.4 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
PlantFusion
When you buy ONE (1) PlantFusion RTD (4pk) or Protein Powder, any size or variety
Exp 03/05/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Clif Bar
When you buy ONE (1) Clif ZBAR (12 pk)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 50¢
ZzzQuil
when you buy ONE (1) Vicks ZzzQuil PURE Zzzs Product. Excludes Vicks PURE Zzzs Kidz Product, Vicks PURE Zzzs Soothing Aromatherapy Balm Product and trial/travel size.
Exp 02/092 days left!

Sign In to Load
Qualifying Products


Save $1.00
Rethink
When you buy ONE (1) Rethink Water, any size or variety
Exp 03/02/2019

Sign In to Load
Qualifying Products


Save $3.00
Carvel
When you buy ONE (1) Carvel® or OREO® Ice Cream Cake, any variety (32 oz. or larger)
Exp 03/08/2019

Sign In to Load
Qualifying Products
ClickList Only Offer

Free with Purchase
Blue Buffalo
when you buy ONE (1) bag of BLUE dry dog food (10-lb. or larger). Offer valid only when you purchase using Grocery Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/24/2019

Sign In to Load
Qualifying Products


Save $1.00
Truvia
When you buy ONE (1) Truvia Stevia Sweetener, any variety or size.
Exp 02/28/2019

Sign In to Load
Qualifying Products


Save $3.00
One A Day
when you buy ONE (1) One A Day Vitamin Product, any variety (26ct - 200ct).
Exp 04/30/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Febreze
when you buy ONE (1) Febreze Car (2 ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00 on 2
Bear Naked
when you buy TWO (2) BEAR NAKED® Products, Any Flavor, Mix or Match (7.2 oz. or Larger)
Exp 02/27/2019

Sign In to Load
Qualifying Products


Save $3.00
Purina
when you buy ONE (1) Purina® Dog Chow® or Puppy Chow® Dry Dog Food, any variety (35lb bag or larger)
Exp 03/17/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Horizon
When you buy ONE (1) Horizon or Silk 6pk Single Serve Milk
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 30¢
Yoplait
when you buy ONE (1) Oui™ by Yoplait® Petites French-style yogurt (2-PACK)
Exp 03/14/2019

Sign In to Load
Qualifying Products


Save $1.00
Foodstirs
when you buy ONE (1) Foodstirs Organic Baking Mix or Organic Minute Mug Cake Mix, any variety or size
Exp 03/01/2019

Sign In to Load
Qualifying Products


Buy 2, Get 1 Free
Ajax
Buy TWO (2) Ajax® Ultra Dish Liquids (28.0 oz), Get your THIRD (3rd) Free (Valid on 28.0 oz ONLY, Max value $2.00)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 50¢
Kroger Brand
When you buy ONE (1) Bakery Fresh Goodness 8x8 Cornbread Square, any variety (16 oz).
Exp 03/03/2019

Sign In to Load
Qualifying Products


Save $1.00
fountain of health
when you buy ONE (1) Fountain of Health or Humm! Hummus, any variety (9 or 10 oz.)
Exp 02/28/2019

Sign In to Load
Qualifying Products


Save $2.00
Crest
when you buy ONE (1) Crest 3D White Whitening Therapy Enamel Care, Sensitivity, Charcoal, OR Ingredients (3 oz or larger). Excludes all other variants, Kids and trial/travel size.
Exp 02/23/2019

Sign In to Load
Qualifying Products


Save $3.00
Flintstones
when you buy ONE (1) Flintstones Vitamin Product, any variety (60-180ct).
Exp 04/30/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Store Brand
When you buy ONE (1) Kroger Frozen Meatballs, any variety (26 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Glade
When you buy ONE (1) Glade Mist Aerosol
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
TUCKS
when you buy ONE (1) Tucks, any variety (100 ct).
Exp 04/01/2019

Sign In to Load
Qualifying Products


Save $1.00
Libman
when you buy ONE (1) Libman Tornado Mop.
Exp 03/05/2019

Sign In to Load
Qualifying Products


Save $12.00
Nicorette
off any ONE (1) Nicorette Gum 160ct or larger
Exp 04/30/2019

Sign In to Load
Qualifying Products


Save 50¢
S&B Foods
When you buy ONE (1) S&B Wasabi Paste
Exp 02/28/2019

Sign In to Load
Qualifying Products


Save $1.00
Katz Gluten Free
When you buy ONE (1) Katz Cupcake, any variety (7oz)
Exp 03/16/2019

Sign In to Load
Qualifying Products


Save $1.00
Pull-Ups
when you buy ONE (1) PULL-UPS® Training Pants or GOODNITES® Nighttime Pants or Bed Mats. Not valid on 7 ct. or less.
Exp 02/16/2019

Sign In to Load
Qualifying Products


Save $5.00
Swiffer
when you buy ONE (1) Swiffer Sweep & Vac OR Steamboost Starter Kit. Excludes trial/travel size.
Exp 02/23/2019

Sign In to Load
Qualifying Products


Save 50¢
ZzzQuil
when you buy ONE (1) Vicks ZzzQuil Product. Excludes PURE Zzzs and trial/travel size.
Exp 02/092 days left!

Sign In to Load
Qualifying Products


Save $1.00
Instant Power
When you buy ONE (1) Instant Power Hair Clog Drain Remover
Exp 03/02/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Kuner's
When you buy ONE (1) Kuners Beans any variety (15 - 15.5oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
Carbona
when you buy ONE (1) Carbona Stain Devil (1.7 oz.) or Color Run Remover (2.6 oz.), any variety
Exp 03/16/2019

Sign In to Load
Qualifying Products


Save $1.50
1850 Coffee
when you buy ONE (1) 1850™ Brand Coffee, any size. Excludes Iced Coffee.
Exp 03/31/2019

Sign In to Load
Qualifying Products


Save 50¢
Hellmann's
when you buy ONE (1) Hellmanns or Best Foods Real Ketchup product (14 oz. or larger)
Exp 02/24/2019

Sign In to Load
Qualifying Products


Save 75¢
Dove
when you buy ONE (1) Dove Men+Care Face product. Excludes trial and travel sizes.
Exp 02/092 days left!

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Burt's Bees
when you buy ONE (1) Burt's Bees toothpaste (4.2 oz or larger)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.00
The Jackfruit Company
When you buy ONE (1) The Jackfruit Company Frozen Entrée, any variety (9 or 9.5 oz.)
Exp 03/31/2019

Sign In to Load
Qualifying Products


Save $2.00
Jarrow Formulas
When you buy ONE (1) Jarrow Product, any variety or size
Exp 02/24/2019

Sign In to Load
Qualifying Products


Save $2.00
L'Oreal
when you buy ONE (1) L'Oreal Paris Infallible Foundation or Concealer. Excluding trial and travel sizes.
Exp 02/25/2019

Sign In to Load
Qualifying Products


Save $3.00
Purina
when you buy ONE (1) Purina® Dog Chow® or Puppy Chow® Dry Dog Food bag, any variety (35 lb or larger).
Exp 03/17/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Cascade
when you buy ONE (1) Cascade Action Pacs (17-23 ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 25¢
Suave
when you buy ONE (1) Suave Lotion. Excludes trial and travel sizes.
Exp 02/092 days left!

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Scrubbing Bubbles
when you buy ONE (1) Scrubbing Bubbles Bath Trigger or Scrubbing Bubbles Toilet Gel
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Cascadian Farm
when you buy ONE (1) Cascadian Farm Bars Multipack, any variety (6.2 -7.4 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 75¢
Dove
when you buy ONE (1) Dove Advanced Care Antiperspirant Deodorant.Excludes Dove Men+Care, multipacks and trial and travel sizes.
Exp 02/092 days left!

Sign In to Load
Qualifying Products


Save $1.00
Maybelline
When you buy ONE (1) Maybelline New York Mascara, any variety or size
Exp 02/23/2019

Sign In to Load
Qualifying Products


Save $5.00 on 2
Suave
when you buy TWO (2) Suave Professionals for Natural Hair product. Excludes 2 oz. trial and travel sizes and twin packs.
Exp 03/03/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

Save 25¢
Everyday Living
when you buy ONE (1) Everyday Living Pizza Cutter. Use up to 5 times in a single transaction, while supplies last. Offer valid only when you purchase using Pickup, exclusive coupons valid for pickup only. Limited to stock on hand; Selection Varies; One Coupon Per Household
Exp 02/092 days left!

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Bagel Bites
When you buy ONE (1) Bagel Bites & Bagel Dogs, any variety (7.75 - 18.66oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.50 on 2
Dial
when you buy TWO (2) Dial Complete® Foaming Hand Wash Pumps, any size.
Exp 03/31/2019

Sign In to Load
Qualifying Products


Save 50¢
Other
when you cash a payroll or goverrnment paper check at Money Services.
Exp 04/20/2019

Sign In to Load
Qualifying Products


Save $10.00
Alli
when you buy ONE (1) alli Weight Loss Aid, refill pack (120 ct. capsule).
Exp 03/30/2019

Sign In to Load
Qualifying Products


Save $1.00
Sparkling Ice
when you buy any ONE (1) Sparkling Ice Product, any variety (12-pack).
Exp 02/28/2019

Sign In to Load
Qualifying Products


Save $1.00
Kroger Brand
When you buy ONE (1) Bakery Fresh Goodness Cherry Pie (8 in), available in the Bakery. Limit 1 per transaction.
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $1.50 on 2
Purina
when you buy TWO (2) packages of Purina® Beggin®, Busy®, or Dentalife® dog treats, any variety or size.
Exp 03/19/2019

Sign In to Load
Qualifying Products


Save 75¢
Kroger Brand
When you buy ONE (1) Bakery Fresh Goodness Brownie Bites (16 oz). Use up to 5 times in a single transaction, while supplies last.
Exp 03/05/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
JACK LINKS
when you buy ONE (1) Jack Links Jerky (2.85 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00 on 2
Chicken of the Sea
when you buy TWO (2) Chicken of the Sea Chunk Infusions (2.8 oz), Chicken of the Sea Solid White (5 oz), Chicken of the Sea Salmon Can (5 oz) or Genova (5 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Private Selection
When you buy ONE (1) Private Selection Frozen Fruit, any variety (16 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 70¢
Simple Truth
When you buy ONE (1) Simple Truth Roasted & Salted No Shell Pistachios, 6 oz
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save $3.00
Eucerin
when you buy ONE (1) Eucerin® Body Lotion or Cream Product (8 oz. or larger) Or Eucerin® Baby Product. Excludes trial sizes
Exp 04/15/2019

Sign In to Load
Qualifying Products


Save $2.00
Delsym
when you buy ONE (1) Delsym® Product
Exp 03/31/2019

Sign In to Load
Qualifying Products
5X Event

Save 75¢
Slim Jim
when you buy any ONE (1) Slim Jim, any flavor ( 14 ct Box or larger)
Exp 02/19/2019

Sign In to Load
Qualifying Products
Lunar New Year Savings

Save 50¢
Dynasty Foods
When you buy ONE (1) Dynasty Gluten Free Panko
Exp 02/28/2019

Sign In to Load
Qualifying Products


Save $1.00
Dove
when you buy ONE (1) Dove Clinical Protection Antiperspirant Deodorant. Excludes Dove Men+Care, multipacks and trial and travel sizes.
Exp 02/092 days left!

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Tide
when you buy ONE (1) Tide Simply Liquid (31-34 oz) or Tide Simply (13 ct Pods)
Exp 02/19/2019

Sign In to Load
Qualifying Products


Save 75¢
Hilarys
when you buy ONE (1) Apple Maple or Spicy Veggie Meatless Breakfast Sausages (7.3 oz.)
Exp 03/15/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Glade
when you buy ONE (1) Glade Scented oil (2 ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products
Lunar New Year Savings

Save 25¢
Calbee
When you buy ONE (1) Calbee Shrimp Chips, any variety
Exp 02/28/2019

Sign In to Load
Qualifying Products


Save $1.00
Edge
when you buy ONE (1) Edge®, Skintimate® or Schick® Hydro® Shave gel or cream. Excludes 2 oz. and 2.75 oz.
Exp 03/30/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$3.49
Store Brand
when you buy ONE (1) Bakery Cupcakes (6 ct). Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/15/2019

Sign In to Load
Qualifying Products
ClickList® Hot Digital Offer

$3.99
Kroger Brand
when you buy ONE (1) Kroger Brand Deli Pizza, any variety, in the Deli Dept. Use up to 5 times in a single transaction. Offer valid only when you purchase using Pickup. Exclusive coupons valid for pickup only. Not valid on delivery orders.
Exp 02/092 days left!

Sign In to Load
Qualifying Products


Save $3.00
Rainbow Light
when you buy ONE (1) Rainbow Light Multivitamin, Womens, Mens, Probiolicious, Prenatal, and Kids varieties (50-90ct).
Exp 02/23/2019

Sign In to Load
Qualifying Products


Save 50¢
SCOTT
when you buy ONE (1) SCOTT® Towels, any variety (6 count or larger)
Exp 02/092 days left!

Sign In to Load
Qualifying Products
5X Event

Save $1.50
Clif Bar
When you buy ONE (1) Clif Bar (12 pk)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Vanity Fair
when you buy ONE (1) Vanity Fair Napkins (40 - 100 ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save 50¢
Kuners
When you buy ONE (1) Kuners Tomatoes any variety (14.5 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00 on 2
Cascadian Farm
When you buy TWO (2) Cascadian Farm Cereal or Box Granola or Annies Cereal
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00 on 4
Kool-Aid
When you buy FOUR (4) Kool Aid Burts any variety (40.5 oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Ore-Ida
When you buy ONE (1) Ore Ida Frozen Mashed Potatoes, any variety (22oz)
Exp 02/19/2019

Sign In to Load
Qualifying Products
5X Event

Save $1.00
Mr. Clean
when you buy ONE (1) Mr. Clean Eraser (2ct)
Exp 02/19/2019

Sign In to Load
Qualifying Products
"
    end
    
end
