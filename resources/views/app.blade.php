<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    @vite('resources/css/app.css')
    {{-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> --}}
    {{-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-vue/2.23.1/bootstrap-vue.min.js" integrity="sha512-SP/zE7YazvnUG95bWnA1AeC5+WtAOqumEHSgcKTNfVefAMsDcVCt6D3Q3goqR3vSf50zPG3OZtnMjBJd9GBgkw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> --}}
    <style>
      header {
        background:url('newbg.png');}
      body {
        font-family: 'Plus Jakarta Sans', sans-serif;
    }
    </style>
    
    @vite('resources/js/app.js')
    @inertiaHead
  </head>
  <body>
    @inertia
  </body>
</html>