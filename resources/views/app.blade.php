<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    @vite('resources/css/app.css')
    <style>
      @font-face {
          font-family: 'MaiolaPro'; /*a name to be used later*/
          src: url('http://localhost:8000/fonts/MaiolaPro_29360.ttf'); /*URL to font*/
      }
    </style>
    @vite('resources/js/app.js')
    @inertiaHead
  </head>
  <body>
    @inertia
  </body>
</html>