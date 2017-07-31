# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|

  inflect.irregular 'tipo_de_imposto', 'tipos_de_impostos'
  inflect.irregular 'tipo_de_desconto', 'tipos_de_descontos'


end
