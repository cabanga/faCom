$(document).ready(function(){


  if ( $('div.alert.fade.in').length ) {

    $('div.alert.fade.in').addClass("box-notification");
    $('div.alert.fade.in').addClass("box-notification-sombra");
    $('div.alert.fade.in').addClass("animateOpen");

    $('button.close').addClass("hide");

    setTimeout(function(){

      $(".box-notification.box-notification-sombra").removeClass("animateOpen");
      $(".box-notification.box-notification-sombra").addClass("animateClose");

    }, 3000);
  }


})
