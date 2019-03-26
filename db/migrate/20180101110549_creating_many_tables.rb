class CreatingManyTables < ActiveRecord::Migration
  def change
    create_table :krogercheckout51 do |t|
      t.string :title1
      t.string :title2
      t.string :value1
      t.string :value2
      t.string :link1
      t.string :link2
      t.string :store1
      t.string :store2
      t.timestamps
    end
    create_table :krogertargetcoupon do |t|
      t.string :title1
      t.string :title2
      t.string :value1
      t.string :value2
      t.string :link1
      t.string :link2
      t.string :store1
      t.string :store2
      t.timestamps
    end
    create_table :krogersavingstar do |t|
      t.string :title1
      t.string :title2
      t.string :value1
      t.string :value2
      t.string :link1
      t.string :link2
      t.string :store1
      t.string :store2
      t.timestamps
    end
    create_table :checkout51targetcoupon do |t|
      t.string :title1
      t.string :title2
      t.string :value1
      t.string :value2
      t.string :link1
      t.string :link2
      t.string :store1
      t.string :store2
      t.timestamps
    end
    create_table :checkout51savingstar do |t|
      t.string :title1
      t.string :title2
      t.string :value1
      t.string :value2
      t.string :link1
      t.string :link2
      t.string :store1
      t.string :store2
      t.timestamps
    end
    create_table :targetcouponsavingstar do |t|
      t.string :title1
      t.string :title2
      t.string :value1
      t.string :value2
      t.string :link1
      t.string :link2
      t.string :store1
      t.string :store2
      t.timestamps
    end
  end
end


# krogercheckout51, krogertargetcoupon, krogersavingstar, checkout51targetcoupon, checkout51savingstar, targetcouponsavingstar, krogeribotta, ibottacheckout51, ibottasavingstar, targetibottum

# options[params[:store]].create(title1: x_title_placeholder.join(" "), title2: y_title_placeholder.join(" "), value1: x.value, value2: y.value, link1: x.link, link2: y.link, repeaters: z) 
                