$(document).ready(function(){


  if ( $('div.alert.fade.in').length ) {

    $('div.alert.fade.in').addClass("box-notification");
    $('div.alert.fade.in').addClass("animacao-open");
    $('button.close').addClass("hide");

    setTimeout(function(){
      $("div.alert.fade.in").fadeOut(3000);

    }, 3000);
  }


})
