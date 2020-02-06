import re, glob

for i in glob.glob('./html_wlink/*.html'):
  with open(i, 'r') as myfile :
    filedata = myfile.read()
  filedata = filedata.replace('../css/', '')
  with open(i, 'w') as file:
    file.write(filedata)
