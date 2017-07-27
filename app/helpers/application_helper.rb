module ApplicationHelper

  def testo_da_factura_index(is)
    if (is)
      "Paga"
    else
      "Não Paga"
    end

  end

  def esta_activado(is)
    if (is)
      "Desactivar"
    else
      "Activar"
    end
  end

  def texto_da_factura(is)
    if (is)
      "Cancelar Factura"
    else
      "Pagar Factura"
    end
  end

  def icon_da_factura(is)
    if (is)
      "<i class='fa fa-close' aria-hidden='true'></i>"
    else
      "<i class='fa fa-check' aria-hidden='true'></i>"
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


    Float.class_eval do
      # Converte floats para kwanza
      # deve ser chamado como método de instância
      def to_kwanza
        valor = self
        valor = 0 if valor.blank?
        number_to_currency(valor, :locale => :ao)
      end

      def to_month
        self.to_i.to_month
      end

      def to_month_abbr
        self.to_i.to_month_abbr
      end
    end

    BigDecimal.class_eval do
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

    Integer.class_eval do
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

    Fixnum.class_eval do
      # Converte decimals para kwanza
      # deve ser chamado da como método de instância
      def to_kwanza
        self.to_f.to_kwanza
      end

      # Converte um inteiro em mês
      def to_month
        if (1..12).include?(self)
          I18n.t('date.month_names')[self]
        end
      end

      # Converte um inteiro em mês abreviado
      def to_month_abbr
        if (1..12).include?(self)
          I18n.t('date.abbr_month_names')[self]
        end
      end
    end

    Hash.class_eval do
      # prepara um hash para um select
      def for_select
        self.map { |k, v| [k.to_s, k.to_s] }.to_h
      end

      def for_select_pt
        self.map { |k, v| [k.to_s.pt, k.to_s] }.to_h
      end
    end

    NilClass.class_eval do
      ['to_kwanza', 'to_month', 'to_month_abbr'].each do |nome_do_metodo|
        define_method nome_do_metodo do
          nil
        end
      end

      def to_string(s = "")
        nil
      end
    end

  # ============================= Frame para mostrar (PDF) na pagina ===================================

  def iframe(options = {})
    concat(content_tag(:iframe, class: options[:class], src: options[:src], width: options[:width], height: options[:height]) do
    end).html_safe
  end

  def texto_de_rodape
    bounding_box([143, bounds.bottom + 15], :width => 540, :height => 30) {
      bounding_box([-143, bounds.bottom + 15], :width => 540, :height => 5) do
        stroke_horizontal_rule
      end
      font("Courier") do
        text "Processado por faCom", size: 9, :valign => :bottom
      end
    }
  end

  def logotipo_da_empresa
    return if @empresa.blank?

    bounding_box([0, cursor + 30], :width => 100, :height => 70) do
      logotipo = @empresa.logotipo.present? ? @empresa.logotipo.to_s : "#{Rails.root}/app/assets/images/facom.png"

      if Rails.env.development? || Rails.env.test? # Tese para os ambientes
        if (@empresa.logotipo.present?)
          image "#{Rails.root}/public#{logotipo}", :position => :left, :width => 60
        else
          image "#{Rails.root}/app/assets/images/facom.png", :position => :left, :width => 60
        end
      else
       if (@empresa.logotipo.present?)
         image open(logotipo), :position => :left, :width => 60
       else
          image "#{Rails.root}/app/assets/images/facom.png", :position => :left, :width => 60
       end
      end
    end
  end

  def informacoes_da_empresa
    return if @empresa.blank?

    bounding_box([0, cursor + 0], :width => 250, :height => 65) do
      text "#{@empresa.nome}", size: 10, :font_style => :bold
      move_down 3
      text "#{@empresa.email} | #{formatar_numero_telefone(@empresa.telemovel)}", size: 7
      move_down 3
      text "Cidade Luanda, Angola", size: 7
      move_down 3
    end
  end

  def formatar_numero_telefone(numero)
    telemovel = "+244 #{numero.scan(/.{3}|.+/).join(" ")}"
  end


end
