{"filter":false,"title":"20171210092313_kroger.rb","tooltip":"/db/migrate/20171210092313_kroger.rb","undoManager":{"mark":7,"position":7,"stack":[[{"start":{"row":1,"column":0},"end":{"row":2,"column":5},"action":"remove","lines":["  def change","  end"],"id":2},{"start":{"row":1,"column":0},"end":{"row":8,"column":5},"action":"insert","lines":["  def change","    create_table :kroger_tables do |t|","      t.integer :value, null: false","      t.string :store, null: false","      t.string :title, null: false","      t.string :link, null: false","    end","  end"]}],[{"start":{"row":2,"column":30},"end":{"row":2,"column":31},"action":"remove","lines":["s"],"id":3}],[{"start":{"row":2,"column":29},"end":{"row":2,"column":30},"action":"remove","lines":["e"],"id":4}],[{"start":{"row":2,"column":28},"end":{"row":2,"column":29},"action":"remove","lines":["l"],"id":5}],[{"start":{"row":2,"column":27},"end":{"row":2,"column":28},"action":"remove","lines":["b"],"id":6}],[{"start":{"row":2,"column":26},"end":{"row":2,"column":27},"action":"remove","lines":["a"],"id":7}],[{"start":{"row":2,"column":25},"end":{"row":2,"column":26},"action":"remove","lines":["t"],"id":8}],[{"start":{"row":2,"column":24},"end":{"row":2,"column":25},"action":"remove","lines":["_"],"id":9}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":10,"column":0},"end":{"row":10,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1512897809069,"hash":"060840c17beac1040e2bdf1c7e5956928d64b1c8"}