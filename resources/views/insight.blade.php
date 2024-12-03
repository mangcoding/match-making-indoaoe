@extends('layouts.frontend')

@section('content')
<div class="lg:pb-20 lg:pt-5 w-full">
    <div class="flex items-center justify-center container mx-auto">
        <h1 class="text-7xl md:text-9xl xl:text-[17.5rem] font-black font-satoshi text-center">
            INSIGHTS
        </h1>
    </div>
</div>
<div class="w-full flex flex-col top-[480px] pt-20 pr-9 pb-20 pl-9 gap-10">
    <div class="w-full overflow-x-auto">
        <ul class="w-max flex gap-2">
            <li class="bg-white border-[1px] text-xs md:text-lg font-lato font-normal border-black rounded-[40px] flex py-1 px-3 md:py-3 md:px-6 hover:bg-black hover:text-white">
                <a href="#">ALL</a>
            </li>
            <li class="bg-white border-[1px] text-xs md:text-lg font-lato font-normal border-black rounded-[40px] flex py-1 px-3 md:py-3 md:px-6 hover:bg-black hover:text-white">
                <a href="#">BUILD ORDER</a>
            </li>
            <li class="bg-white border-[1px] text-xs md:text-lg font-lato font-normal border-black rounded-[40px] flex py-1 px-3 md:py-3 md:px-6 hover:bg-black hover:text-white">
                <a href="#">TIPS & TRICK</a>
            </li>
        </ul>
    </div>

    <div class="w-full grid grid-cols-1 md:grid-cols-2  gap-10 md:gap-5">
        @for ($i =0; $i < 6; $i++)
        <div class="w-full rounded-[12px] bg-gray-200 flex gap-[10px] p-[16px] lg:p-[32px]">
            <div class="w-full max-w-[567px] flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex flex-col md:flex-row gap-8 items-center">
                    <div class="w-full md:w-3/12 flex-shrink-0">
                        <img class="rounded-xl w-full max-h-40 object-cover object-top md:object-center" src="{{ asset('image/Rectangle 11.png') }}" alt="">
                    </div>
                    <div class="flex flex-col gap-4 md:w-full">
                        <h4 class="text-lg sm:text-2xl md:text-3xl font-satoshi font-medium">Arabia Fast Feudal -> Archer Rush</h4>
                        <div class="flex flex-wrap gap-2">
                            <div class="flex items-center gap-2">
                                <div class="w-6 h-6 bg-red-700 rounded-md"></div>
                                <span class="text-sm sm:text-base lg:text-lg font-satoshi">Advanced</span>
                            </div>
                            <div class="flex items-center gap-2">
                                <img src="{{ asset('image/Rectangle 28.png') }}" class="rounded-md w-6 h-6" alt="">
                                <span class="text-sm sm:text-base lg:text-lg font-satoshi">19 Pop</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="w-full">
                    <p class="font-satoshi text-[16px] lg:text-[18px] leading-[24px] lg:leading-[28px] mb-[16px] text-gray-500">
                        Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                        Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                    </p>
                    <div class="w-full lg:w-[576px] flex flex-wrap gap-[12px]">
                        <button class="px-[16px] py-[8px] rounded-[60px] bg-white hover:bg-gray-700 hover:text-white">
                            <span class="text-[16px] lg:text-[18px] leading-[24px] lg:leading-[28px] font-satoshi">Build Order</span>
                        </button>
                        <button class="px-[16px] py-[8px] rounded-[60px] bg-white hover:bg-gray-700 hover:text-white">
                            <span class="text-[16px] lg:text-[18px] leading-[24px] lg:leading-[28px] font-satoshi">Generic Civ</span>
                        </button>
                        <button class="px-[16px] py-[8px] rounded-[60px] bg-white hover:bg-gray-700 hover:text-white">
                            <span class="text-[16px] lg:text-[18px] leading-[24px] lg:leading-[28px] font-satoshi">Archer</span>
                        </button>
                        <button class="px-[16px] py-[8px] rounded-[60px] bg-white hover:bg-gray-700 hover:text-white">
                            <span class="text-[16px] lg:text-[18px] leading-[24px] lg:leading-[28px] font-satoshi">Team Game</span>
                        </button>
                    </div>
                </div>
        </div>
    </div>
    @endfor
</div>
</div>

@section('scripts')
@parent
@endsection


@endsection
