module ImportHelper
  def demoday
    importer = ImporterDemoday.new('1KFOCGLPaSsE-ey1IzQiw03YEmryZuutwMtT-1KxRQJQ',
                                   :user => 'maedevelops@gmail.com',
                                   :password => 'mypass1234')
    importer.import
  end
end