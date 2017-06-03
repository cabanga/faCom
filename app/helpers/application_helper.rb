module ApplicationHelper

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
