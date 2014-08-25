module ImportHelper
  def demoday_importer
      importer = ImporterDemoday.new(ENV["GOOGLE_SHEET_DEMODAY"],
                                   :user => ENV["GOOGLE_ACCT"],
                                   :password => ENV["GOOGLE_PWD"])
    importer.import
  end
end