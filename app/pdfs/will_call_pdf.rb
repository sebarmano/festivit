class WillCallPdf < Prawn::Document
  TIX = ["4day", "Youth", "PorS", "Thu", "Fri", "Sat", "Sun", "PRESS", "Anyday", "TENT", "TENT1", "TENTps", "VHC", "VHC1", "VHCps", "FPKNG", "FPKNGps", "DTLAN", "DT50","DREAM"]
  def initialize(participants)
    super(page_layout: :landscape)
    @participants = participants
    header
    participants_table
  end

  def header
    text "Shakori Hills Will Call List", size:30, style: :bold
  end

  def participants_table
    move_down 20
    table participant_rows, :cell_style => { size: 7 } do
      row(0).font_style = :bold
      self.header = true
      columns(1..-1).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
    end
  end

  def participant_rows
#    [["Name"] + TicketType.select(:productpairsid).group(:productpairsid).count.map {|k,v| k}]
     [["Name"] + TIX] + 
     @participants.each.map do |participant|
         [participant.name] + tix_count(participant)
     end
  end

  def tix_count(p)
    count = []
    hh = Hash[p.tickets.map{|t| [t.ticket_type.productpairsid, t.qty]}]
    TIX.each do |t|
      count << hh[t]
    end
    count
  end
end

