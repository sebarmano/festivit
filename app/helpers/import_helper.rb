module ImportHelper
  def demoday_importer
      importer = ImporterDemoday.new('1KFOCGLPaSsE-ey1IzQiw03YEmryZuutwMtT-1KxRQJQ',
                                   :user => 'maedevelops@gmail.com',
                                   :password => 'mypass1234')
                                   #TODO - set up env variables in Heroku to replace this fake acct
    importer.import
  end
end