class DetalheDaFactura < Prawn::Document
  include ApplicationHelper

  def initialize(factura, view)
    super(top_margin: 70)
    @empresa = factura.empresa
    @factura = factura
    @view = view

    logotipo
    dados_do_cliente
    # move_down 100
    # cabecalho_da_factura
    # quadro_de_itens
    # move_down 90
    # linha
    # referencia_do_total
    # como_pagar
    rodape
    # transparent(1) { stroke_bounds }

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

    # def cabecalho_da_factura
    #   table([['', '', '', 'Período', 'Data']],
    #     position: 0,
    #     :column_widths => [ 108, 108, 108, 150, 66],
    #     :cell_style =>  {:borders => [:top], :align => :left, :size => 8,:font_style => :bold, height: 18})do
    #     row(0).border_width = 1.3
    #
    #     end
    #     table([['', '', '', "", "#{@pagamento.created_at.strftime('%d-%m-%Y')}"]],
    #     position: 0,
    #     :column_widths => [ 108, 108, 108, 150, 66],
    #     :cell_style =>  {:borders => [], :align => :left, :size => 7, height: 30, :padding => [0, 0, 0, 5]}) do
    #       column(4).style(:align => :left)
    #     end
    #
    #   move_up 15
    #
    #   table([['', '', '', 'Condição Pagamento', 'Vencimento']],
    #     position: 0,
    #     :column_widths => [ 108, 108, 108, 150, 66],
    #     :cell_style =>  {:borders => [], :align => :left, :size => 8,:font_style => :bold, height: 18})
    #   table([["", "", "",'Pronto Pagamento', "#{@pagamento.created_at.strftime('%d-%m-%Y')}"]],
    #     position: 0,
    #     :column_widths => [ 108, 108, 108, 150, 66],
    #     :cell_style =>  {:borders => [:bottom], :align => :left, :size => 7, height: 18, :padding => [0, 0, 0, 5]}) do
    #       row(0).border_width = 0.5
    #       column(4).style(:align => :left)
    #     end
    # end
    #
    # def quadro_de_itens
    #   table([['Tipo de Plano', 'Descrição', 'Pr./SMS', 'Desc.', 'IPC' ,'Valor']],
    #     position: 0, :column_widths => [ 90, 90, 90, 90, 90, 83],
    #     :cell_style =>  {:borders => [], :align => :right, :size => 7,:font_style => :bold, :padding => [5, 0, 5, 5]}) do
    #       column(0).style(:align => :left)
    #       column(1,).style(:align => :left)
    #     end
    #
    #   table([["#{@pagamento.plano.nome}", "#{@pagamento.descricao}", "#{@pagamento.plano.custo_por_sms.to_kwanza}",
    #     "#{0.to_kwanza}", "#{0.to_kwanza}", "#{@pagamento.custo.to_kwanza}" ]],
    #     position: 0, :column_widths => [ 90, 90, 90, 90, 90, 83,],
    #     :cell_style =>  {:borders => [], height: 10, :padding => [0, 0, 0, 5], :align => :right, :size => 6}) do
    #       column(0,).style(align: :left)
    #       column(1,).style(align: :left)
    #     end
    # end
    #
    # def linha
    #   table([[""]],
    #     position: 0,
    #     :column_widths => [540],
    #     :cell_style =>  {:borders => [:bottom], :padding => [0, 0, 0, 5]}) do
    #       row(0).border_width = 0.2
    #     end
    # end
    #
    # def referencia_do_total
    #   bounding_box([350, bounds.bottom + 270], :width => 190, :height => 80) do
    #   indent(5) do
    #     text 'Mercadoria/Serviços', size: 7, :align => :left
    #     move_down 5
    #     text 'Descontos Comerciais', size: 7, :align => :left
    #     move_down 5
    #     text 'Descontos Financeiro', size: 7, :align => :left
    #     move_down 5
    #     text 'IPC', size: 8, :font_style => :bold, :align => :left
    #   end
    #   move_down 4
    #   stroke_horizontal_rule
    #   indent(5) do
    #     move_down 5.5
    #     text 'Total', :styles => [:bold], size: 10, :align => :left
    #   end
    #  end
    #
    #  bounding_box([345, bounds.bottom + 270], :width => 190, :height => 80) do
    #    indent(10) do
    #      text "#{@pagamento.custo.to_kwanza}", size: 7, :align => :right
    #      move_down 5
    #      text '0,00 AKZ', size: 7, :align => :right
    #      move_down 5
    #      text '0,00 AKZ', size: 7, :align => :right
    #      move_down 5
    #      text "0,00 AKZ", size: 7, :align => :right
    #      move_down 9.5
    #      text "#{@pagamento.custo.to_kwanza}",:styles => [:bold], size: 10, :align => :right
    #    end
    #   end
    # end
    #
    # def como_pagar
    #   bounding_box([0, bounds.bottom + 110], :width => 185, :height => 110) {
    #     text 'Como Pagar', :styles => [:bold], size: 12, :align => :left
    #     stroke_horizontal_rule
    #     move_down 5
    #     text '1. Pagamentos', size: 8, :align => :left
    #     move_down 5
    #     text '2. Pagamento de Serviços', size: 8, :align => :left
    #     move_down 5
    #     text '3. Introduzir os Dados (Entidade, Referência, Valor)', size: 8, :align => :left
    #     move_down 5
    #     text '4. Confirmar Pagamento', size: 8, :align => :left
    #     move_down 5
    #     text '5. Retirar o Cartão e o Recibo', size: 8, :align => :left
    #     move_down 5
    #   }
    # end
    #
    def rodape
      #estado_factura
      texto_de_rodape
    end
    #
    # def estado_factura
    #   bounding_box([458, bounds.bottom + 35], :width => 83, :height => 10, :font_style => :bold) do
    #     text 'Estado da Factura', size: 7, :align => :center
    #   end
    #   case @pagamento.estado
    #     when 'pago'
    #       table([[@pagamento.estado.pt]],  position: 460,
    #         :column_widths => [80],
    #         :cell_style =>  {:font_style => :bold,:background_color => '5cb85c', :borders => [], :align => :center, :size => 9, :text_color => 'FFFFFF'})
    #     else 'nao_pago'
    #       table([[@pagamento.estado.pt]],  position: 460,
    #         :column_widths => [80],
    #         :cell_style =>  {:font_style => :bold, :background_color => 'f0ad4e', :borders => [], :align => :center, :size => 9, :text_color => 'FFFFFF'})
    #   end
    # end

end
