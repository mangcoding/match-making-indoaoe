@extends('layouts.frontend')
@section('content')
<div class="relative w-full h-[500px]">
    <div
        class="w-full h-full"
        style="background-image: url('/image/Hero21.png'); background-size: 100% 100%; background-position: center; background-repeat: no-repeat;">
    </div>
</div>


<div class="flex flex-col items-center gap-[32px] w-full mt-[80px]">
    <div class="flex justify-center items-center">
        <span class="text-base md:text-xl leading-[28px] font-satoshi text-center">
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


<div class="w-full flex flex-col md:flex-row my-9 px-6 md:px-16 gap-6 md:gap-0">
    <span class="text-base md:text-xl w-full md:w-4/12">
        LET’S GET TO KNOW ABOUT INDOAOE
    </span>
    <h1 class="text-3xl md:text-6xl leading-[48px] md:leading-[68px] w-full md:w-6/12 font-satoshi ml-auto">
        Lörem ipsum ådarade. Lass den kronehugisk tills kyde. Diling rologi lunirat hemigengen.
    </h1>
</div>


<div class="container mx-auto px-4">
    <div class="items-center w-full flex flex-col md:flex-row">
        <img class="w-full md:w-7/12" src="{{ asset('image/PHONE MOCKUP.png') }}" alt="">
        <div class="w-full md:w-5/12 flex flex-col gap-2 ">
            <span class="text-base md:text-xl font-satoshi leading-7">WE PROVIDE COMMUNITY MATCHMAKING BOT</span>
            <h1 class="text-3xl md:text-6xl md:leading-[68px] leading-[48px]">Lörem ipsum ådarade. Lass den kronehugisk tills kyde. </h1>
            <div class="flex items-center">
                <button class="bg-black rounded-[60px] flex items-center pt-[8px] pr-[8px] pb-[8px] pl-[24px] gap-[16px] md:w-[237px] w-[180px] justify-between">
                    <span class="md:text-xl text-base leading-[28px] font-satoshi text-white">GET STARTED</span>
                    <span class="bg-red-700 md:w-12 md:h-12 w-9 h-9 rounded-full flex items-center justify-center top-3 left[137px]">
                        <img src="{{ asset('image/Vector.png')}}" class="md:w-5 w-3" alt="">
                    </span>
                </button>
            </div>
        </div>
    </div>
</div>


<div class="bg-black w-full flex justify-center items-center my-[16px] pt-[95px] pr:[28px] pb-[95px] pl-[28px] md:pt-[120px] md:pr-[36px] md:pb-[120px] md:pl-[36px]">
    <h2 class="text-white text-3xl md:text-[80px] font-satoshi font-bold text-center">MORE THAN JUST A COMMUNITY</h2>
</div>


<div class="px-4 md:px-16 w-full flex flex-col md:flex-row md:py-16 py-0 my-10">
    <div class="w-full md:w-8/12 relative h-[370px] md:h-[480px]">
        <div class="absolute top-[126px] md:left-[40px] left-[5px] z-30 bg-gray-900 p-[24px] rounded-[24px] md:w-[488px] w-full border-[1px] border-white gap-[24px]">
            <div class="flex items-center gap-8 mb-4">
                <img class="w-auto h-[60px] rounded-[60px]" src="{{ asset('image/Rectangle 40.png') }}" alt="Sponsor 1">
                <h3 class="text-white font-satoshi font-semibold text-2xl md:text-4xl">Nickname</h3>
            </div>
            <div class="flex flex-col items-center justify-center mt-auto">
                <p class="text-sm md:text-lg text-white mb-4 mt-0">
                    “Lörem ipsum rynade ons däsk. Solig trall, i trer dekakrode, doning olig. Trefoliga henifiera seminetik.”
                </p>
                <button class="md:w-[159px] w-[145px] border-[1px] border-white bg-black text-white rounded-[60px] p-2 pr-[16px] flex gap-[10px] text-sm md:text-base">
                    <img src="{{asset('image/Vector1.png')}}" alt="">
                    Steam Profile
                </button>
            </div>
        </div>
        <div class="absolute top-[102px] md:left-[64px] left-[29px] z-20 bg-gray-900 p-[24px] rounded-[24px] md:w-[488px] w-full border-[1px] border-white gap-[24px]">
            <div class="flex items-center gap-8 mb-4">
                <img class="w-auto h-[60px] rounded-[60px]" src="{{ asset('image/Rectangle 40.png') }}" alt="Sponsor 1">
                <h3 class="text-white font-satoshi font-semibold text-2xl md:text-4xl">Nickname</h3>
            </div>
            <div class="flex flex-col items-center justify-center mt-auto">
                <p class="text-sm md:text-lg text-white mb-4 mt-0">
                    “Lörem ipsum rynade ons däsk. Solig trall, i trer dekakrode, doning olig. Trefoliga henifiera seminetik.”
                </p>
                <button class="md:w-[159px] w-[145px] border-[1px] border-white bg-black text-white rounded-[60px] p-2 pr-[16px] flex gap-[10px] text-sm md:text-base">
                    <img src="{{asset('image/Vector1.png')}}" alt="">
                    Steam Profile
                </button>
            </div>
        </div>
        <div class="absolute top-[78px] md:left-[88px] left-[52px] z-10 bg-gray-900 p-[24px] rounded-[24px] md:w-[488px] w-full border-[1px] border-white gap-[24px]">
            <div class="flex items-center gap-8 mb-4">
                <img class="w-auto h-[60px] rounded-[60px]" src="{{ asset('image/Rectangle 40.png') }}" alt="Sponsor 1">
                <h3 class="text-white font-satoshi font-semibold text-2xl md:text-4xl">Nickname</h3>
            </div>
            <div class="flex flex-col items-center justify-center mt-auto">
                <p class="text-sm md:text-lg text-white mb-4 mt-0">
                    “Lörem ipsum rynade ons däsk. Solig trall, i trer dekakrode, doning olig. Trefoliga henifiera seminetik.”
                </p>
                <button class="md:w-[159px] w-[145px] border-[1px] border-white bg-black text-white rounded-[60px] p-2 pr-[16px] flex gap-[10px] text-sm md:text-base">
                    <img src="{{asset('image/Vector1.png')}}" alt="">
                    Steam Profile
                </button>
            </div>
        </div>
        <div class="absolute top-[54px] md:left-[112px] left-[72px] z-0 bg-gray-900 p-[24px] rounded-[24px] md:w-[488px] w-full border-[1px] border-white gap-[24px]">
            <div class="flex items-center gap-8 mb-4">
                <img class="w-auto h-[60px] rounded-[60px]" src="{{ asset('image/Rectangle 40.png') }}" alt="Sponsor 1">
                <h3 class="text-white font-satoshi font-semibold text-2xl md:text-4xl">Nickname</h3>
            </div>
            <div class="flex flex-col items-center justify-center mt-auto">
                <p class="text-sm md:text-lg text-white mb-4 mt-0">
                    “Lörem ipsum rynade ons däsk. Solig trall, i trer dekakrode, doning olig. Trefoliga henifiera seminetik.”
                </p>
                <button class="md:w-[159px] w-[145px] border-[1px] border-white bg-black text-white rounded-[60px] p-2 pr-[16px] flex gap-[10px] text-sm md:text-base">
                    <img src="{{asset('image/Vector1.png')}}" alt="">
                    Steam Profile
                </button>
            </div>
        </div>
    </div>

    <div class="flex gap-[40px] flex-col last-order my-10 md:w-4/12 w-full">
        <div class="flex gap-[24px] flex-col">
            <span class="md:text-xl text-base leading-7 font-satoshi">ACTIVE COMMUNITY PLAYERS FOR FUN</span>
            <p class="text-3xl md:text-6xl font-satoshi md:leading-[68px] leading-[48px]">Lörem ipsum ådarade. Lass den kronehugisk tills kyde. </p>
        </div>
        <button class="bg-black rounded-[60px] flex items-center pt-[8px] pr-[8px] pb-[8px] pl-[24px] gap-[16px] md:w-[197px] w-[157px] justify-between">
            <span class="md:text-xl text-base leading-[28px] font-satoshi text-white">VIEW ALL</span>
            <span class="bg-red-700 md:w-12 md:h-12 w-9 h-9  rounded-full flex items-center justify-center top-[12px] left[137px]">
                <img src="{{ asset('image/Vector.png')}}" class="md:w-5 w-3" alt="">
            </span>
        </button>
    </div>
</div>





<div class="container mx-auto md:px-4 px-2">
    <div class="w-full flex flex-col md:flex-row gap-[8px] mb-10">
        <h1 class="text-base md:text-xl leading-[48px] md:leading-[68px] font-satoshi w-full md:w-4/12">OUR COMMUNITY EVENTS</h1>
        <h1 class="text-4xl md:text-6xl leading-[48px] md:leading-[68px] font-satoshi w-full md:w-8/12">Lörem ipsum ådarade. Lass den kronehugisk tills kyde. Diling rologi lunirat hemigengen.</h1>
    </div>
</div>


<div class="w-full flex gap-[32px] flex-row my-10">
    <img class="w-full md:w-[1088px]" src="{{ asset('image/Rectangle 7.png')}}" alt="">
    <img class="w-full md:w-[1088px] rounded-[24px]" src="{{ asset('image/Rectangle 6.png')}}" alt="">
    <img class="w-full md:w-[1088px]" src="{{ asset('image/Rectangle 8.png')}}" alt="">
</div>

<div class="w-full flex flex-col items-start md:items-center mx-auto mb-40 px-4">
    <h1 class="text-3xl md:text-6xl text-left md:text-center md:leading-[68px] leading-[48px] font-satoshi">
        Support Indonesian Age of Empires community to continue to grow and develop by making your donation.
    </h1>
    <div class="flex items-center justify-start md:justify-center">
        <button class="bg-black rounded-[60px] flex items-center pt-[8px] pr-[8px] pb-[8px] pl-[24px] gap-[16px] md:w-[186px] w-[150px] justify-between">
            <span class="md:text-xl text-base leading-[28px] font-satoshi text-white">DONATE</span>
            <span class="bg-red-700 md:w-12 md:h-12 w-9 h-9 rounded-full flex items-center justify-center">
                <img src="{{ asset('image/Vector.png')}}" class="md:w-5 w-3" alt="">
            </span>
        </button>
    </div>
</div>




@endsection

