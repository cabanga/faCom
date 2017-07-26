class DetalheDaFactura < Prawn::Document
  include ApplicationHelper
  Prawn::Font::AFM.hide_m17n_warning = true
  def initialize(factura, view)
    super(top_margin: 40)
    @empresa = factura.empresa
    @factura = factura
    @view = view

    referencia
    logotipo
    move_up 15
    info_da_empresa
    dados_do_cliente
    move_down 70
    cabecalho_da_factura
    # quadro_de_itens
    move_down 90
    linha
    referencia_do_total

    rodape
    #transparent(1) { stroke_bounds }

  end

  private
    def referencia
      bounding_box([430, cursor + 0], :width => 120, :height => 30) do
        indent(0) do
          formatted_text [{:text => "Factura Nº. #{@factura.referencia}", :styles => [:bold], :size =>9, :align => :right}]
        end
      end
    end

    def logotipo
      logotipo_da_empresa
    end

    def dados_do_cliente
      bounding_box([300, cursor + 65], :width => 240, :height => 65) do
        text "#{@factura.cliente}", size: 10, :font_style => :bold, :align => :left
        move_down 3
        text "#{@factura.contacto} ", size: 7
        move_down 3
        text "Cidade Luanda, Angola", size: 7
      end
    end

    def info_da_empresa
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

    def cabecalho_da_factura
      table([['Tipo de Serviço', '', '', '', 'Data']],
        position: 0,
        :column_widths => [ 108, 108, 108, 150, 66],
        :cell_style =>  {:borders => [:top], :align => :left, :size => 8,:font_style => :bold, height: 18})do
          row(0).border_width = 1.3
        end

        table([["#{@factura.tipo_de_servico}", '', '', "", "#{Time.now.strftime('%d-%m-%Y')}"]],
        position: 0,
        :column_widths => [ 108, 108, 108, 150, 66],
        :cell_style =>  {:borders => [], :align => :left, :size => 7, height: 30, :padding => [0, 0, 0, 5]}) do
          column(4).style(:align => :left)
        end

      move_up 15

      table([['', '', '', 'Condição Pagamento', 'Vencimento']],
        position: 0,
        :column_widths => [ 108, 108, 108, 150, 66],
        :cell_style =>  {:borders => [], :align => :left, :size => 8,:font_style => :bold, height: 18})

      table([["", "", "",'Pronto Pagamento', "#{@factura.created_at.strftime('%d-%m-%Y')}"]],
        position: 0,
        :column_widths => [ 108, 108, 108, 150, 66],
        :cell_style =>  {:borders => [:bottom], :align => :left, :size => 7, height: 18, :padding => [0, 0, 0, 5]}) do
          row(0).border_width = 0.5
          column(4).style(:align => :left)
        end
    end

    def linha
      table([[""]],
        position: 0,
        :column_widths => [540],
        :cell_style =>  {:borders => [:bottom], :padding => [0, 0, 0, 5]}) do
          row(0).border_width = 0.2
        end
    end

    def referencia_do_total
      bounding_box([350, bounds.bottom + 270], :width => 190, :height => 80) do
      indent(5) do
        text 'Mercadoria/Serviços', size: 7, :align => :left
        move_down 5
        text 'Descontos Comerciais', size: 7, :align => :left
        move_down 5
        text 'Descontos Financeiro', size: 7, :align => :left
        move_down 5
        text 'IPC', size: 8, :font_style => :bold, :align => :left
      end
      move_down 4
      stroke_horizontal_rule
      indent(5) do
        move_down 5.5
        text 'Total', :styles => [:bold], size: 10, :align => :left
      end
     end

     bounding_box([345, bounds.bottom + 270], :width => 190, :height => 80) do
       indent(10) do
         text "0,00 AKZ", size: 7, :align => :right
         move_down 5
         text '0,00 AKZ', size: 7, :align => :right
         move_down 5
         text '0,00 AKZ', size: 7, :align => :right
         move_down 5
         text "0,00 AKZ", size: 7, :align => :right
         move_down 9.5
         text "0,00 AKZ",:styles => [:bold], size: 10, :align => :right
       end
      end
    end

    def rodape
      estado_factura
      texto_de_rodape
    end

    def estado_factura
      bounding_box([458, bounds.bottom + 35], :width => 83, :height => 10, :font_style => :bold) do
        text 'Estado da Factura', size: 7, :align => :center
      end

      if (@factura.is_payd)
        table([["Pago"]],  position: 460,
          :column_widths => [80],
          :cell_style =>  {:font_style => :bold,:background_color => '5cb85c', :borders => [], :align => :center, :size => 9, :text_color => 'FFFFFF'})
      else
        table([["Não Pago"]],  position: 460,
          :column_widths => [80],
          :cell_style =>  {:font_style => :bold, :background_color => 'f0ad4e', :borders => [], :align => :center, :size => 9, :text_color => 'FFFFFF'})
      end

    end

end
