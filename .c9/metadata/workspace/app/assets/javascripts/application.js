{"filter":false,"title":"application.js","tooltip":"/app/assets/javascripts/application.js","undoManager":{"mark":14,"position":14,"stack":[[{"start":{"row":35,"column":3},"end":{"row":36,"column":0},"action":"insert","lines":["",""],"id":575}],[{"start":{"row":36,"column":0},"end":{"row":37,"column":0},"action":"insert","lines":["",""],"id":576}],[{"start":{"row":37,"column":0},"end":{"row":48,"column":3},"action":"insert","lines":["$(\".task-check\").bind('change', function(){","  if (this.checked){","    $.ajax({","      url: '/todos/'+this.value+'/toggle',","      type: 'POST',","      data: {\"completed\": this.checked}","    });","  }","  else {","     alert(\"no\");","  }","});"],"id":577}],[{"start":{"row":36,"column":0},"end":{"row":37,"column":0},"action":"insert","lines":["",""],"id":578}],[{"start":{"row":24,"column":0},"end":{"row":49,"column":3},"action":"remove","lines":["$(\".task-check\").bind('change', function(){","  if (this.checked){","    $.ajax({","      url: 'homepage#index',","      type: 'POST',","      data: {\"completed\": this.checked}","    });","  }","  else {","     alert(\"no\");","  }","});","","","$(\".task-check\").bind('change', function(){","  if (this.checked){","    $.ajax({","      url: '/todos/'+this.value+'/toggle',","      type: 'POST',","      data: {\"completed\": this.checked}","    });","  }","  else {","     alert(\"no\");","  }","});"],"id":579}],[{"start":{"row":24,"column":0},"end":{"row":27,"column":3},"action":"insert","lines":["$('#toggler').click(function() {","    $('input[type=\"radio\"]').not(':checked').prop(\"checked\", true);","    $('#div1').html($('input[type=\"radio\"]:checked').val())","});"],"id":580}],[{"start":{"row":17,"column":0},"end":{"row":17,"column":3},"action":"insert","lines":["// "],"id":581}],[{"start":{"row":17,"column":0},"end":{"row":17,"column":3},"action":"remove","lines":["// "],"id":582}],[{"start":{"row":18,"column":0},"end":{"row":20,"column":3},"action":"remove","lines":["$(\"#Btn\").on(\"click\", function(){","    ","});"],"id":583}],[{"start":{"row":20,"column":0},"end":{"row":21,"column":0},"action":"remove","lines":["",""],"id":584}],[{"start":{"row":19,"column":0},"end":{"row":20,"column":0},"action":"remove","lines":["",""],"id":585}],[{"start":{"row":18,"column":0},"end":{"row":19,"column":0},"action":"remove","lines":["",""],"id":586}],[{"start":{"row":19,"column":0},"end":{"row":22,"column":3},"action":"remove","lines":["$('#toggler').click(function() {","    $('input[type=\"radio\"]').not(':checked').prop(\"checked\", true);","    $('#div1').html($('input[type=\"radio\"]:checked').val())","});"],"id":587}],[{"start":{"row":18,"column":0},"end":{"row":19,"column":0},"action":"remove","lines":["",""],"id":588}],[{"start":{"row":17,"column":12},"end":{"row":18,"column":0},"action":"remove","lines":["",""],"id":589}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":17,"column":12},"end":{"row":17,"column":12},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1520683679306,"hash":"5e2750b66d5b263f26c1f2933c6607b6a3d41d94"}