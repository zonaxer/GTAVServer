$(function () {
  window.addEventListener('message', function (event) {
    if (event.data.type === 'open') {
      $('#general').css('display', 'block');
      $('#topbar').css('display', 'flex');
      $('.username1').html(event.data.player);
      $('.curbalance').html(event.data.balance);
      $('.valorCorona').html(event.data.valorCorona);

    }
  })
})
$('.btn-sign-out').click(function () {
  $('#general, #waiting, #transferUI, #withdrawUI, #depositUI, #topbar').hide()
  $('body').removeClass('active')
  $.post('http://esx_banking/NUIFocusOff', JSON.stringify({}))
})



document.onkeyup = function (data) {
  if (data.which == 27) {
    $('#general, #waiting, #transferUI, #withdrawUI, #depositUI, #topbar').hide()
    $('body').removeClass('active')
    $.post('http://esx_banking/NUIFocusOff', JSON.stringify({}))
  }
}

$("#deposit1").submit(function(e) {
  e.preventDefault(); // Prevent form from submitting
  console.log($("#cantidad").val())
  console.log($('#valorCorona').val())

  $.post('http://sg_vip/cambio', JSON.stringify({
    cantidad: $("#amount").val(),
    valorCorona: $('#valorCorona').text()
  }));

});


