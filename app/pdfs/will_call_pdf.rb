class WillCallPdf < Prawn::Document
  TIX = ["4day", "Youth", "PorS", "Thu", "Fri", "Sat", "Sun", "PRESS", "TENT", "VHC",  "FPKNG", "Anyone"]
  COLORS = ["f09e85", "f0eb6b", "f1868c", "75b8b0", "d183a9", "75b8b0", "9d8ca7", "f1bb6a", "8788a6", "477dca", "999999", "dddddd" ]
  def initialize(participants)
    super()
    @participants = participants
    header
    participants_table
  end

  def header
    text "Shakori Hills Fall 2014 - Will Call List", size:30, style: :bold
  end

  def participants_table
    move_down 20
    table participant_rows, :cell_style => { size: 9 } do
      row(0).font_style = :bold
      self.header = true
      columns(1..-1).align = :center
      self.row_colors = ["dddddd", "ffffff"]
      12.times do |i| #TODO change this for the count of columns 
        columns(i+1).first.background_color = COLORS[i]
      end
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

