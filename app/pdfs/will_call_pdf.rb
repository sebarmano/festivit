class WillCallPdf < Prawn::Document
  def initialize(participants)
    super()
    @participants = participants
    header
    participants_table
  end

  def header
    text "This is the header"
  end

  def participants_table
    text "here goes the participants table"
  end
end

