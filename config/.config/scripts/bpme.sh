#!/bin/bash

# retrieve configuration files
wget https://raw.githubusercontent.com/DevStation-COCC/bend-201d3/master/configs/.gitignore https://raw.githubusercontent.com/DevStation-COCC/bend-201d3/master/configs/.eslintrc.json https://raw.githubusercontent.com/angular/angular.js/master/LICENSE https://raw.githubusercontent.com/DevStation-COCC/bend-201d3/master/class-02/demo/reset.css
  
# make project directories
mkdir ./js ./css ./img

# make project files
touch ./README.md ./index.html ./js/app.js ./css/style.css

# move configuration files into project directory
mv reset.css ./css/

# add use strict to JS file
echo "'use strict';
" >> ./js/app.js

# add HTML boilerplate
echo '<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title></title>
  <link rel="stylesheet" href="./css/reset.css">
  <link rel="stylesheet" href="./css/style.css">
</head>
<body>
  <script src="./js/app.js"></script>
</body>
</html>
' >> ./index.html
