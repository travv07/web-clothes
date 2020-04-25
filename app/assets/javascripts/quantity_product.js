$(document).ready(function(){
  var quantity = parseInt($("#quantity").val());
  var max = $('#quantity').attr('max');
  console.log(max);
  $("#minus").click(function(){
    quantity = quantity - 1;
    if(quantity < 1) {
      quantity = 1;
    }
    $("#quantity").val(quantity);
  });
  $("#plus").click(function(){
    quantity = quantity + 1;
    if(quantity > max) {
      quantity = max;
    }
    $("#quantity").val(quantity);
  });
});
