import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResourse from 'vue-resourse'

Vue.use(VueResourse)

document.addEventListener('turbolins:load', () =>{
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  var ellement = document.getElementById('factura-from')

  if (ellement != null) {
    var factura = JSON.parse(ellement.dataset.factura)
    var item_facturas_attributes = JSON.parse(ellement.dataset.item_facturasAttributes)

    item_facturas_attributes.forEach(function(item){item._destroy = null});
    factura.item_facturas_attributes = item_facturas_attributes
    var app = new Vue({
      el: ellement,
      mixins: [TurbolinksAdapter],
      data: function(){
        return {factura: factura}
      }

    })

    console.log(app)
  }
})
