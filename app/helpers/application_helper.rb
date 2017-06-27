module ApplicationHelper

  def esta_activado(is)
    if (is)
      "Desactivar"
    else
      "Activar"
    end
  end

  def cor_do_activar_e_desactivar(is)
    if (is)
      'color-desactivar'
    else
      'color-activar'
    end
  end

  def icon_activar_e_desactivar(is)
    if (is)
      "<i class='fa fa-bell-slash-o' aria-hidden='true'></i>"
    else
      "<i class='fa fa-bell-o' aria-hidden='true'></i>"
    end
  end

  def estado_da_empresa(is)
    if (is)
      "Activado"
    else
      "Desactivado"
    end
  end

  def breadcrumb_index(items)
    content_tag(:div, :class => "") do
      content_tag(:ol, :class => "breadcrumb") do
        items.collect { |item| concat(content_tag(:li, item, class: "active")) }
      end
    end
  end

  Bignum.class_eval do
    # Converte decimals para kwanza
    # deve ser chamado da como método de instância
    def to_kwanza
      self.to_f.to_kwanza
    end

    def to_month
      self.to_i.to_month
    end

    def to_month_abbr
      self.to_i.to_month_abbr
    end
  end



end
