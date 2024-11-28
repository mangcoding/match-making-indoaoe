<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Website</title>
    <!-- Link ke CSS dan JS -->
    {{-- <link href="{{ mix('css/app.css') }}" rel="stylesheet">
    <script src="{{ mix('js/app.js') }}" defer></script> --}}

    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <link href="https://fonts.googleapis.com/css2?family=Satoshi:wght@100;300;400;700;900&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    {{-- <style>
        @import url('https://fonts.googleapis.com/css2?family=Satoshi:wght@100;300;400;700;900&display=swap');
    </style> --}}
    <style>
  
      .swiper {
        width: 100%;
        height: 100%;
      }
  
      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
      }
  
      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
    </style>
    @yield('styles')
</head>
<body class="">
    <!-- Header atau Navbar -->
    <header class="bg-white">
      <div class="container p-4 sm:p-6 w-full flex justify-between items-center">
        <a href="#" class="flex items-center space-x-3 rtl:space-x-reverse pl-14">
          <img src="{{ asset('image/logo-1 1.png') }}" class="h-8" alt="Logo" />
        </a>
        <nav class="justify-end items-center space-x-4 hidden md:flex">
          <a href="{{ route('about') }}" class="hover:text-gray-200 p-2 rounded leading-[28px] text-center text-[18px] font-[700] font-satoshi">About</a>
          <a href="{{ route('matchmaking') }}" class="hover:text-gray-200 p-2 rounded leading-[28px] text-center text-[18px] font-[700] font-satoshi">Matchmaking</a>
          <a href="{{ route('insight') }}" class="hover:text-gray-200 p-2 rounded leading-[28px] text-center text-[18px] font-[700] font-satoshi">Insights</a>
          <a href="{{ route('event') }}" class="hover:text-gray-200 p-2 rounded leading-[28px] text-center text-[18px] font-[700] font-satoshi">Events</a>
          <a href="{{ route('player') }}" class="hover:text-gray-200 p-2 rounded leading-[28px] text-center text-[18px] font-[700] font-satoshi">Players</a>
          <button id="languageButton" class="flex items-center space-x-2 hover:bg-gray-100 text-black w-24 rounded-[60px] px-[8px] py-[8px] pr-[16px] ml-4 border-[1px] border-black">
            <img src="{{ asset('image/Flag.png') }}" class="h-8" alt="Flag" />
            <span class="text-lg font-semibold leading-7">EN</span>
          </button>
        </nav>
        <!-- Hamburger Menu for Mobile -->
        <div class="md:hidden flex items-center">
          <button id="hamburgerButton" class="text-gray-500 hover:text-gray-800 focus:outline-none">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" class="h-6 w-6">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
            </svg>
          </button>
        </div>
      </div>
    
      <!-- Dropdown Menu for Mobile -->
      <div id="dropdownMenu" class="absolute hidden bg-white border-2 border-gray-200 rounded-lg shadow-lg mt-2 w-32 transition-all duration-200 ease-in-out opacity-0 scale-95 pt-2 pb-2 pl-2 pr-4">
        <div class="flex items-center space-x-2 cursor-pointer py-2 hover:bg-gray-100">
            <img src="{{ asset('image/Flag.png') }}" class="h-8" alt="Flag" />
            <span class="text-lg font-semibold">EN</span>
        </div>
        <div class="flex items-center space-x-2 cursor-pointer py-2 hover:bg-gray-100">
            <img src="{{ asset('image/Flag (1).png') }}" class="h-8" alt="Flag" />
            <span class="text-lg font-semibold">ID</span>
        </div>
      </div>

    
      <!-- Mobile Navigation -->
      <nav id="mobileNav" class="absolute left-0 top-0 w-full bg-white border-b-2 border-gray-200 md:hidden hidden">
        <div class="flex flex-col items-center py-4 space-y-4">
          <a href="{{ route('about') }}" class="hover:text-gray-200 text-center text-[18px] font-[700] font-satoshi">About</a>
          <a href="{{ route('matchmaking') }}" class="hover:text-gray-200 text-center text-[18px] font-[700] font-satoshi">Matchmaking</a>
          <a href="{{ route('insight') }}" class="hover:text-gray-200 text-center text-[18px] font-[700] font-satoshi">Insights</a>
          <a href="{{ route('event') }}" class="hover:text-gray-200 text-center text-[18px] font-[700] font-satoshi">Events</a>
          <a href="{{ route('player') }}" class="hover:text-gray-200 text-center text-[18px] font-[700] font-satoshi">Players</a>
          <button id="mobileLanguageButton" class="flex items-center space-x-2 hover:bg-gray-100 text-black w-24 rounded-[60px] px-[8px] py-[8px] pr-[16px] border-[1px] border-black">
            <img src="{{ asset('image/Flag.png') }}" class="h-8" alt="Flag" />
            <span class="text-lg font-semibold leading-7">EN</span>
          </button>
        </div>
      </nav>

    </header>
    

    <!-- Konten spesifik halaman -->
    <main class="flex-grow">
        @yield('content')
    </main>

    <!-- Footer -->
    <footer class="bg-black py-6 mt-auto">
        <div class="container mx-auto flex flex-col items-center gap-6">
            <div class="flex justify-between items-center flex-col sm:flex-row">
                <img src="{{ asset('image/logo 1.png') }}" class="w-[304px] pt-12 pl-0 pr-10" alt="Logo" />
                <h1 class="w-[883px] text-center text-[60px] sm:text-6xl text-gray-500 leading-[68px] font-medium">
                    14! START THE GAME ALREADY!
                </h1>
            </div>
            <div class="flex justify-between px-4 w-full text-gray-500 pt-48">
                <div class="flex gap-[10px] font-semibold text-[18px]">
                    <a href="https://www.instagram.com/zsrirahmwti20" class=" hover:text-white">Instagram</a>
                    <a href="#" class=" hover:text-white">Discord</a>
                    <a href="https://youtube.com/@jakiasrirahmawati4334" class=" hover:text-white">Youtube</a>
                </div>
                <div class="flex gap-[10px] font-semibold text-[18px]">
                    <a href="#" class=" hover:text-white">About</a>
                    <a href="#" class=" hover:text-white">Matchmaking</a>
                    <a href="#" class=" hover:text-white">Insights</a>
                    <a href="#" class=" hover:text-white">Events</a>
                    <a href="#" class=" hover:text-white">Players</a>
                    <a href="#" class=" hover:text-white">Sponsors</a>
                </div>
            </div>
            <div class="w-full">
                <span class="text-[290px] flex justify-center text-gray-500 font-medium m-0 p-0">
                    INDOAOE
                </span>
            </div>
        </div>
    </footer>


   
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <script>
      var swiper = new Swiper(".mySwiper", {
        slidesPerView: 3,
        spaceBetween: 30,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
      });
    </script>
    <script>
      const hamburgerButton = document.getElementById('hamburgerButton');
      const dropdownMenu = document.getElementById('dropdownMenu');
      const mobileNav = document.getElementById('mobileNav');
      const mobileLanguageButton = document.getElementById('mobileLanguageButton');

      hamburgerButton.addEventListener('click', function() {
        mobileNav.classList.toggle('hidden'); 
        dropdownMenu.classList.add('hidden'); 
      });

      mobileLanguageButton.addEventListener('click', function() {
        dropdownMenu.classList.add('hidden'); 
      });

      document.addEventListener('click', function(event) {
        if (!dropdownMenu.contains(event.target) && !mobileLanguageButton.contains(event.target) && !hamburgerButton.contains(event.target)) {
          dropdownMenu.classList.add('hidden');
          mobileNav.classList.add('hidden'); 
        }
      });
    </script>



@yield('scripts')


</body>
</html>
