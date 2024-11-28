<script src="https://cdn.tailwindcss.com"></script>
<link href="https://fonts.googleapis.com/css2?family=Satoshi:wght@100;300;400;700;900&display=swap" rel="stylesheet">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Satoshi:wght@100;300;400;700;900&display=swap');
</style>
<title>Home</title>

@extends('layouts.frontend')

@section('content')
<div class="relative w-full h-[500px]">
    <div class="absolute inset-0 w-full h-full" 
         style="background-image: url('/image/Hero21.png'); background-size: cover; background-position: center; background-repeat: no-repeat;">
    </div>
</div>




<div class="flex flex-col items-center gap-[32px] w-full mt-[80px]">
    <div class="flex justify-center items-center">
        <span class="text-[20px] leading-[28px] font-satoshi text-center">
            SPONSORS THAT PARTNERED WITH US 
        </span>
    </div>

    <div class="swiper mySwiper">
        <div class="swiper-wrapper mb-28 mt-10">
            <div class="swiper-slide">
                <div class="flex justify-center items-center bg-gray-200 p-[8px] rounded-[8px] w-[304px] h-[100px]">
                    <img class="w-full h-full object-contain" src="{{ asset('image/logo 2.png') }}" alt="Sponsor">
                </div>
            </div>
            <div class="swiper-slide">
                <div class="flex justify-center items-center bg-gray-200 p-[8px] rounded-[8px] w-[304px] h-[100px]">
                    <img class="w-full h-full object-contain" src="{{ asset('image/logo 2.png') }}" alt="Sponsor">
                </div>
            </div>
            <div class="swiper-slide">
                <div class="flex justify-center items-center bg-gray-200 p-[8px] rounded-[8px] w-[304px] h-[100px]">
                    <img class="w-full h-full object-contain" src="{{ asset('image/logo 2.png') }}" alt="Sponsor">
                </div>
            </div>
            <div class="swiper-slide">
                <div class="flex justify-center items-center bg-gray-200 p-[8px] rounded-[8px] w-[304px] h-[100px]">
                    <img class="w-full h-full object-contain" src="{{ asset('image/logo 2.png') }}" alt="Sponsor">
                </div>
            </div>
            <div class="swiper-slide">
                <div class="flex justify-center items-center bg-gray-200 p-[8px] rounded-[8px] w-[304px] h-[100px]">
                    <img class="w-full h-full object-contain" src="{{ asset('image/logo 2.png') }}" alt="Sponsor">
                </div>
            </div>
            <div class="swiper-slide"> 
                <div class="flex justify-center items-center bg-gray-200 p-[8px] rounded-[8px] w-[304px] h-[100px]">
                    <img class="w-full h-full object-contain" src="{{ asset('image/logo 2.png') }}" alt="Sponsor">
                </div>
            </div>
        </div>  
        <div class="swiper-pagination"></div>
      </div>
    
    {{-- <div class="container mx-auto px-6 w-full overflow-x-auto">
        <div class="flex gap-[16px]">   
            <div class="flex justify-center items-center bg-gray-200 p-[8px] rounded-[8px] w-[304px] h-[100px]">
                <img class="w-auto h-[60px]" src="{{ asset('image/logo 2.png') }}" alt="Sponsor 2">
            </div>
            <div class="flex justify-center items-center bg-gray-200 p-[8px] rounded-[8px] w-[304px] h-[100px]">
                <img class="w-auto h-[60px]" src="{{ asset('image/logo 2.png') }}" alt="Sponsor 3">
            </div>
            <div class="flex justify-center items-center bg-gray-200 p-[8px] rounded-[8px] w-[304px] h-[100px]">
                <img class="w-auto h-[60px]" src="{{ asset('image/logo 2.png') }}" alt="Sponsor 4">
            </div>
            <div class="flex justify-center items-center bg-gray-200 p-[8px] rounded-[8px] w-[304px] h-[100px]">
                <img class="w-auto h-[60px]" src="{{ asset('image/logo 2.png') }}" alt="Sponsor 5">
            </div>
            <div class="flex justify-center items-center bg-gray-200 p-[8px] rounded-[8px] w-[304px] h-[100px]">
                <img class="w-auto h-[60px]" src="{{ asset('image/logo 2.png') }}" alt="Sponsor 6">
            </div>
        </div>
    </div>  --}}
</div>


<div class="w-[1312px] flex flex-row my-9 px-16">
    <span class="text-[20px]">LET’S GET TO KNOW ABOUT INDOAOE</span>
    <h1 class="text-[60px] leading-[68px] w-[752px] font-satoshi ml-auto">Lörem ipsum ådarade. Lass den kronehugisk tills kyde. Diling rologi lunirat hemigengen. </h1>
</div>

<div class="flex items-center w-full my-10">
    <img class="w-[640px]" src="{{ asset('image/PHONE MOCKUP.png') }}" alt="Sponsor 3">
        <div class="w-[672px] flex flex-col gap-[8px] ml-[32px]">
        <span class="text-[20px] font-satoshi leading-7">WE PROVIDE COMMUNITY MATCHMAKING BOT</span>
        <h1 class="text-[60px] leading-[68px]">Lörem ipsum ådarade. Lass den kronehugisk tills kyde. </h1>
        <div class="flex items-center">
            <button class="bg-black rounded-[60px] flex items-center pt-[8px] pr-[8px] pb-[8px] pl-[24px] gap-[16px] w-[237px] justify-between">
                <span class="text-[20px] leading-[28px] font-satoshi text-white">GET STARTED</span>
                <span class="bg-red-700 w-[48px] h-[48px] rounded-full flex items-center justify-center top-[12px] left[137px]">
                    <img src="{{ asset('image/Vector.png')}}" class="w-[20px]" alt="">
                </span>
            </button>
        </div>
        </div>
</div>

<div class="bg-black w-full flex justify-center items-center my-[16px] pt-[120px] pr-[36px] pb-[120px] pl-[36px]">
    <h2 class="text-white text-[80px] font-satoshi font-bold text-center">MORE THAN JUST A COMMUNITY</h2>
</div>


<div class="px-16 w-[1312px] flex flex-row py-16 my-10">
    <div class="w-[640px] relative">
        <div class="absolute top-[126px] left-[40px] z-30 bg-gray-900 p-[24px] rounded-[24px] w-[488px] border-[1px] border-white gap-[24px]">
            <div class="flex items-center gap-8 mb-4">
                <img class="w-auto h-[60px] rounded-[60px]" src="{{ asset('image/Rectangle 40.png') }}" alt="Sponsor 1">
                <h3 class="text-white font-satoshi font-semibold text-4xl">Nickname</h3>
            </div>
            <div class="flex flex-col items-center justify-center mt-auto">
                <p class="text-lg text-white mb-4 mt-0">
                    “Lörem ipsum rynade ons däsk. Solig trall, i trer dekakrode, doning olig. Trefoliga henifiera seminetik.”
                </p>
                <button class="w-[159px] border-[1px] border-white bg-black text-white rounded-[60px] p-2 pr-[16px] flex gap-[10px] text-base">
                    <img src="{{asset('image/Vector1.png')}}" alt="">
                    Steam Profile
                </button>
            </div>
        </div>
        <div class="absolute top-[102px] left-[64px] z-20 bg-gray-900 p-[24px] rounded-[24px] w-[488px] border-[1px] border-white gap-[24px]">
            <div class="flex items-center gap-8 mb-4">
                <img class="w-auto h-[60px] rounded-[60px]" src="{{ asset('image/Rectangle 40.png') }}" alt="Sponsor 1">
                <h3 class="text-white font-satoshi font-semibold text-4xl">Nickname</h3>
            </div>
            <div class="flex flex-col items-center justify-center mt-auto">
                <p class="text-lg text-white mb-4 mt-0">
                    “Lörem ipsum rynade ons däsk. Solig trall, i trer dekakrode, doning olig. Trefoliga henifiera seminetik.”
                </p>
                <button class="w-[159px] border-[1px] border-white bg-black text-white rounded-[60px] p-2 pr-[16px] flex gap-[10px] text-base">
                    <img src="{{asset('image/Vector1.png')}}" alt="">
                    Steam Profile
                </button>
            </div>
        </div>
        <div class="absolute top-[78px] left-[88px] z-10 bg-gray-900 p-[24px] rounded-[24px] w-[488px] border-[1px] border-white gap-[24px]">
            <div class="flex items-center gap-8 mb-4">
                <img class="w-auto h-[60px] rounded-[60px]" src="{{ asset('image/Rectangle 40.png') }}" alt="Sponsor 1">
                <h3 class="text-white font-satoshi font-semibold text-4xl">Nickname</h3>
            </div>
            <div class="flex flex-col items-center justify-center mt-auto">
                <p class="text-lg text-white mb-4 mt-0">
                    “Lörem ipsum rynade ons däsk. Solig trall, i trer dekakrode, doning olig. Trefoliga henifiera seminetik.”
                </p>
                <button class="w-[159px] border-[1px] border-white bg-black text-white rounded-[60px] p-2 pr-[16px] flex gap-[10px] text-base">
                    <img src="{{asset('image/Vector1.png')}}" alt="">
                    Steam Profile
                </button>
            </div>
        </div>
        <div class="absolute top-[54px] left-[112px] z-0 bg-gray-900 p-[24px] rounded-[24px] w-[488px] border-[1px] border-white gap-[24px]">
            <div class="flex items-center gap-8 mb-4">
                <img class="w-auto h-[60px] rounded-[60px]" src="{{ asset('image/Rectangle 40.png') }}" alt="Sponsor 1">
                <h3 class="text-white font-satoshi font-semibold text-4xl">Nickname</h3>
            </div>
            <div class="flex flex-col items-center justify-center mt-auto">
                <p class="text-lg text-white mb-4 mt-0">
                    “Lörem ipsum rynade ons däsk. Solig trall, i trer dekakrode, doning olig. Trefoliga henifiera seminetik.”
                </p>
                <button class="w-[159px] border-[1px] border-white bg-black text-white rounded-[60px] p-2 pr-[16px] flex gap-[10px] text-base">
                    <img src="{{asset('image/Vector1.png')}}" alt="">
                    Steam Profile
                </button>
            </div>
        </div>
    </div>
    
    <div class="flex gap-[40px] flex-col my-10">
        <div class="w-[528px] flex gap-[24px] flex-col">
            <span class="text-xl leading-7 font-satoshi">ACTIVE COMMUNITY PLAYERS FOR FUN</span>
            <p class="text-6xl font-satoshi leading-[68px]">Lörem ipsum ådarade. Lass den kronehugisk tills kyde. </p>
        </div>
        <button class="bg-black rounded-[60px] flex items-center pt-[8px] pr-[8px] pb-[8px] pl-[24px] gap-[16px] w-[197px] justify-between">
            <span class="text-[20px] leading-[28px] font-satoshi text-white">VIEW ALL</span>
            <span class="bg-red-700 w-[48px] h-[48px] rounded-full flex items-center justify-center top-[12px] left[137px]">
                <img src="{{ asset('image/Vector.png')}}" class="w-[20px]" alt="">
            </span>
        </button>
    </div>
</div>





<div class="w-[1312px] flex flex-row gap-[8px] ml-[32px] px-16 mb-10">
    <h1 class="text-[20px] leading-[68px] font-satoshi w-[416px]">OUR COMMUNITY EVENTS</h1>
    <h1 class="text-[60px] leading-[68px] font-satoshi w-[752px]">Lörem ipsum ådarade. Lass den kronehugisk tills kyde. Diling rologi lunirat hemigengen.</h1>
</div>  


<div class="w-[1440px] flex gap-[32px] flex-row my-10">
    <img class="w-[1088px]" src="{{ asset('image/Rectangle 7.png')}}" alt="">
    <img class="w-[1088px] rounded-[24px]" src="{{ asset('image/Rectangle 6.png')}}" alt="">
    <img class="w-[1088px]" src="{{ asset('image/Rectangle 8.png')}}" alt="">
</div>

<div class="w-[1312px] flex flex-col items-center mx-auto mb-40">
    <h1 class="text-[60px] text-center leading-[68px] font-satoshi">
        Support Indonesian Age of Empires community to continue to grow and develop by making your donation.
    </h1>
    <div class="flex items-center">
        <button class="bg-black rounded-[60px] flex items-center pt-[8px] pr-[8px] pb-[8px] pl-[24px] gap-[16px] w-[186px] justify-between">
            <span class="text-[20px] leading-[28px] font-satoshi text-white">DONATE</span>
            <span class="bg-red-700 w-[56px] h-[56px] rounded-full flex items-center justify-center">
                <img src="{{ asset('image/Vector.png')}}" class="w-[20px]" alt="">
            </span>
        </button>
    </div>
</div>


    
@endsection

