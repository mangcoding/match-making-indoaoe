<script src="https://cdn.tailwindcss.com"></script>
<link href="https://fonts.googleapis.com/css2?family=Satoshi:wght@100;300;400;700;900&display=swap" rel="stylesheet">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Satoshi:wght@100;300;400;700;900&display=swap');
</style>
<title>Home</title>

@extends('layouts.frontend')

@section('content')
<div class="relative w-full h-[500px]">
    <div class="absolute inset-0 bg-[url('image/Hero.png')] bg-cover bg-center"></div>
    dgdf
</div>
<div class="flex flex-col items-center gap-[32px] w-full mt-[80px]">
    <div class="flex justify-center items-center">
        <span class="text-[20px] leading-[28px] font-satoshi text-center">
            SPONSORS THAT PARTNERED WITH US 
        </span>
    </div>

    <div class="container mx-auto px-6 w-full overflow-x-auto">
        <div class="flex gap-[16px]">
            <div class="flex justify-center items-center bg-gray-200 p-[8px] rounded-[8px] w-[304px] h-[100px]">
                <img class="w-auto h-[60px]" src="{{ asset('image/logo 2.png') }}" alt="Sponsor 1">
            </div>
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
    </div>
    
         
</div>

<div class="flex items-center w-full">
    <img class="w-[640px]" src="{{ asset('image/PHONE MOCKUP.png') }}" alt="Sponsor 3">
        <div class="w-[672px] flex flex-col gap-[8px] ml-[32px]">
        <h1 class="text-[60px] leading-[68px]">We provide community matchmaking bot</h1>
        <h1 class="text-[60px] leading-[68px] text-gray-400">to split among players become balance.</h1>
        <div class="flex items-center">
            <button class="bg-black rounded-[60px] flex items-center px-[32px] py-[16px] w-[300px]">
                <span class="text-[20px] leading-[28px] font-satoshi font-bold text-white">Get Started</span>
                <span class="bg-red-700 w-[60px] h-[60px] rounded-full flex items-center justify-center ml-auto">
                    <span class="text-white text-[30px]">→</span>
                </span>
            </button>
        </div>
        </div>
</div>

<div class="bg-black w-full flex justify-center items-center my-[16px] pt-[120px] pr-[36px] pb-[120px] pl-[36px]">
    <h2 class="text-white text-[80px] font-satoshi font-bold text-center">MORE THAN JUST A COMMUNITY</h2>
</div>

<div class="w-full flex flex-col gap-[120px]">
    <div class="w-[708px] flex flex-col gap-[8px] ml-[32px] pl-[36px]">
        <h1 class="text-[60px] leading-[68px] font-satoshi">We’ve hosted BIG local tournaments for years</h1>
        <h1 class="text-[60px] leading-[68px] text-gray-400 font-satoshi">with multiple players participated.</h1>
    </div>
    <div class="w-full flex flex-col gap-[40px]">
        <img src="{{ asset('image/Frame 124.png')}}" class="w-[940px]" alt="">
        <div class="w-[708px] pl-[36px] flex gap-[24px] flex-col">
            <span class="text-[32px] leading-[40px] font-satoshi w-[672px]">King of The Kings Grand Final: Skull Del Rel vs Lord Baut</span>
            <span class="text-[20px] leading-[28px] font-satoshi w-[672px] text-gray-400">TOURNAMENT | JAN 2024</span>
        </div>
    </div>
<div class="w-full flex justify-end">
    <div class="w-[940px] flex flex-col gap-[24px]">
        <img src="{{ asset('image/Frame 122.png') }}" class="w-[940px]" alt="">
        <div class="w-[708px] flex flex-col gap-[8px]" style="margin-left: -2px;">
            <span class="text-[32px] leading-[40px] font-satoshi">Gajah Mada Cup: 3v3 Tournament</span>
            <span class="text-[20px] leading-[28px] font-satoshi text-gray-400">TOURNAMENT | JAN 2022</span>
        </div>
    </div>
</div>

<div class="w-[708px] flex flex-col gap-[8px] ml-[32px] pl-[36px]">
    <h1 class="text-[60px] leading-[68px] font-satoshi">Our tournaments made us more competitive</h1>
    <h1 class="text-[60px] leading-[68px] text-gray-400 font-satoshi">with still prioritizing the fun atmosphere.</h1>
</div>

<div class="w-full flex">
    <div class="w-[720px] flex flex-col">
        <img src="{{ asset('image/Group 33.png')}}" class="w-[940px]" alt="">
        <div class="w-[708px] pl-[36px] flex flex-col gap-[24px]">
            <span class="text-[32px] leading-[40px] font-satoshi w-[672px]">Gajah Mada Cup: 3v3 Tournament</span>
            <span class="text-[20px] leading-[28px] font-satoshi w-[672px] text-gray-400">TOURNAMENT | JAN 2022</span>
        </div>
    </div>
    <div class="w-[940px] flex flex-col" style="margin-top: 100px;">
        <img src="{{ asset('image/Group 43.png') }}" class="w-[940px]" alt="">
        <div class="w-[708px] flex flex-col gap-[8px]" style="margin-left: -2px;">
            <span class="text-[32px] leading-[40px] font-satoshi">Gajah Mada Cup: 3v3 Tournament</span>
            <span class="text-[20px] leading-[28px] font-satoshi text-gray-400">TOURNAMENT | JAN 2022</span>
        </div>
    </div>
</div>

<div class="w-full flex justify-between pt-[80px] pr-[36px] pb-[80px] pl-[36px] flex-col">
    <div class="w-[788px] flex gap-40px">
        <div class="w-[672px] flex flex-col gap-[8px] ml-[32px]">
            <h1 class="text-[60px] leading-[68px]">We provide community matchmaking bot</h1>
            <h1 class="text-[60px] leading-[68px] text-gray-400">to split among players become balance.</h1>
            <div class="flex items-center">
                <button class="bg-black rounded-[60px] flex items-center px-[32px] py-[16px] w-[300px]">
                    <span class="text-[20px] leading-[28px] font-satoshi font-bold text-white">DONATE</span>
                    <span class="bg-red-700 w-[60px] h-[60px] rounded-full flex items-center justify-center ml-auto">
                        <img src="{{ asset('image/Vector.png')}}" alt="">
                    </span>
                </button>
            </div>
        </div>
    </div>
    <div class="w-full flex gap-[8px] flex-col items-center">
        <span class="text-[60px] text-center leading-[68px] font-satoshi">
            Support Indonesian Age of Empires community to continue to grow and develop by making your donation.       
        </span>
        <div class="flex items-center">
            <button class="bg-black rounded-[60px] flex items-center px-[32px] py-[16px] w-[186px] gap-[16px]">
                <span class="text-[20px] leading-[28px] font-satoshi text-white">DONATE</span>
                <span class="bg-red-700 w-[60px] h-[60px] rounded-full flex items-center justify-center ml-auto">
                    <img src="{{ asset('image/Vector.png')}}" alt="">
                </span>
            </button>
        </div>
    </div>
</div>




</div>









    
@endsection

