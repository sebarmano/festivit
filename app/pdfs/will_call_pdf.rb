class WillCallPdf < Prawn::Document
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
    table participant_rows, :cell_style => { size: 7 }
  end

  def participant_rows
    [["Name"] + TicketType.all.map {|t| t.productpairsid}]
  end
end

