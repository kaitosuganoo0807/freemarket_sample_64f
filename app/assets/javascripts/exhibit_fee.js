// window.addEventListener('DOMContentLoaded',function(){ 
//   // 価格によって手数料等表示
//   $('#sell-price').on('keyup', function(){
//     let price = $(this).val();
//     let market_fee = Math.floor(price * 0.1)
//     let seller_gain = price - market_fee

//     if (price >= 300 && price <= 9999999) {
//       $('#market_fee').text('¥' + market_fee.toLocaleString())
//       $('#seller_gain').text('¥' + seller_gain.toLocaleString())
//     } else {
//       $('#market_fee').text('-')
//       $('#seller_gain').text('-')
//     }
//   })
// });
