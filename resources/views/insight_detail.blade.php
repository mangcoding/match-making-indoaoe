<script src="https://cdn.tailwindcss.com"></script>
<link href="https://fonts.googleapis.com/css2?family=Satoshi:wght@100;300;400;700;900&display=swap" rel="stylesheet">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Satoshi:wght@100;300;400;700;900&display=swap');
</style>
<title>Insights Details</title>

@extends('layouts.frontend')

@section('content')
<div class="w-full max-w-[1200px] mx-auto rounded-[12px] bg-black flex flex-col items-start justify-center px-[40px] py-[150px] relative">
    <h3 class="text-white leading-[40px] text-[36px] font-satoshi font-medium">
        Arabia Fast Feudal -> Archer Rush
    </h3>
    <span class="text-red-700 leading-[40px] text-[32px] font-lato font-normal mt-[16px]">
        Build by IndoAoe Community
    </span>
    <img src="{{ asset('image/Rectangle 11.png') }}" class="rounded-[12px] w-[381px] absolute top-[50%] right-[40px] translate-y-[-50%]" alt="">
</div>


<div class="container w-full flex flex-col top-[480px] pt-[80px] pr-[36px] pb-[80px] pl-[36px] gap-[40px]">
    <h2 class="w-[976px] text-[48px] leading-[48px] font-satoshi font-medium">Arabia Fast Feudal -> Archer Rush</h2>
    <p class="w-[976px] font-satoshi text-[20px] leading-[28px] text-gray-400">
        Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad. Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
    </p>
</div>


<div class="w-full flex flex-col gap-[32px] left-[64px] mt-8">
    <button class="w-[976px] rounded-[12px] flex items-center pt-[16px] pr-[32px] pb-[16px] pl-[32px] gap-[10px] bg-black">
        <div class="flex gap-[16px] items-center">
            <img src="{{ asset('image/Rectangle 27.png') }}" class="rounded-[12px] w-[48px]" alt="">
            <h3 class="leading-[40px] text-[36px] font-satoshi font-bold text-white">Dark Age</h3>
        </div>
    </button>
    <div class="w-[976px] flex gap-[32px]">
        <div class="w-[80px] h-[80px] rounded-[12px] bg-gray-200 p-[24px] flex items-center justify-center">
            <h5 class="text-[24px] leading-[32px]">3</h5>
        </div>
        <div class="w-[864px] flex justify-start p-[32px] gap-[40px] rounded-[12px] bg-gray-200">
            <div class="w-full flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 28.png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Queue Villagers</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                    <div class="h-[1px] bg-gray-400 w-full"></div>
                </div>
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 16 (6).png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Build 2 Houses</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="w-[976px] flex gap-[32px]">
        <div class="w-[80px] h-[80px] rounded-[12px] bg-gray-200 p-[24px] flex items-center justify-center">
            <span>4-6</span>
        </div>        
        <div class="w-[864px] flex justify-start p-[32px] gap-[40px] rounded-[12px] bg-gray-200">
            <div class="w-full flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 29.png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">6 on Sheep</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="w-[976px] flex gap-[32px]">
        <div class="w-[80px] h-[80px] rounded-[12px] bg-gray-200 p-[24px] flex items-center justify-center">
            <span>7-8</span>
        </div>        
        <div class="w-[864px] flex justify-start p-[32px] gap-[40px] rounded-[12px] bg-gray-200">
            <div class="w-full flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 30.png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">2 on Wood</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="w-[976px] flex gap-[32px]">
        <div class="w-[80px] h-[80px] rounded-[12px] bg-gray-200 p-[24px] flex items-center justify-center">
            <span>9</span>
        </div>        
        <div class="w-[864px] flex justify-start p-[32px] gap-[40px] rounded-[12px] bg-gray-200">
            <div class="w-full flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 301.png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Lure Boar</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="w-[976px] flex gap-[32px]">
        <div class="w-[80px] h-[80px] rounded-[12px] bg-gray-200 p-[24px] flex items-center justify-center">
            <h5>10-12</h5>
        </div>
        <div class="w-[864px] flex justify-start p-[32px] gap-[40px] rounded-[12px] bg-gray-200">
            <div class="w-full flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 301.png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Eat Boar Under TC</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                    <div class="h-[1px] bg-gray-400 w-full"></div>
                </div>
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 302.png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Push Deers using Scout</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="w-[976px] flex gap-[32px]">
        <div class="w-[80px] h-[80px] rounded-[12px] bg-gray-200 p-[24px] flex items-center justify-center">
            <h5 class="text-[24px] leading-[32px]">13</h5>
        </div>
        <div class="w-[864px] flex justify-start p-[32px] gap-[40px] rounded-[12px] bg-gray-200">
            <div class="w-full flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 16 (6).png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Build House</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                    <div class="h-[1px] bg-gray-400 w-full"></div>
                </div>
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 16 (5).png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Send Builder to Build Mining Camp</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="w-[976px] flex gap-[32px]">
        <div class="w-[80px] h-[80px] rounded-[12px] bg-gray-200 p-[24px] flex items-center justify-center">
            <h5 class="text-[24px] leading-[32px]">14</h5>
        </div>
        <div class="w-[864px] flex justify-start p-[32px] gap-[40px] rounded-[12px] bg-gray-200">
            <div class="w-full flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 301.png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Lure 2nd Boar</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="w-[976px] flex gap-[32px]">
        <div class="w-[80px] h-[80px] rounded-[12px] bg-gray-200 p-[24px] flex items-center justify-center">
            <h5 class="text-[24px] leading-[32px]">15-18</h5>
        </div>
        <div class="w-[864px] flex justify-start p-[32px] gap-[40px] rounded-[12px] bg-gray-200">
            <div class="w-full flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 301.png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Eat Boar Under TC</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                    <div class="h-[1px] bg-gray-400 w-full"></div>
                </div>
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 303.png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Loom</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                    <div class="h-[1px] bg-gray-400 w-full"></div>
                </div>
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 304.png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Queue Feudal Age</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                    <div class="h-[1px] bg-gray-400 w-full"></div>
                </div>
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 30.png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Send 6 Vill to Lumber Camp</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                    <div class="h-[1px] bg-gray-400 w-full"></div>
                </div>
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 30.png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Send 4 Vill to Wood Nearby TC</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                    <div class="h-[1px] bg-gray-400 w-full"></div>
                </div>
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 16 (5).png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Send 2 Vill to Mining Camp</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                    <div class="h-[1px] bg-gray-400 w-full"></div>
                </div>
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 305.png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Build Barrack + 1 House</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="w-full flex flex-col gap-[32px] left-[64px] mt-8">
    <button class="w-[976px] rounded-[12px] flex items-center pt-[16px] pr-[32px] pb-[16px] pl-[32px] gap-[10px] bg-black">
        <div class="flex gap-[16px] items-center">
            <img src="{{ asset('image/Rectangle 26.png') }}" class="rounded-[12px] w-[48px]" alt="">
            <h3 class="leading-[40px] text-[36px] font-satoshi font-bold text-white">Feudal Age</h3>
        </div>
    </button>
    <div class="w-[976px] flex gap-[32px]">
        <div class="w-[80px] h-[80px] rounded-[12px] bg-gray-200 p-[24px] flex items-center justify-center">
            <h5 class="text-[24px] leading-[32px]">19-23</h5>
        </div>        
        <div class="w-[864px] flex justify-start p-[32px] gap-[40px] rounded-[12px] bg-gray-200">
            <div class="w-full flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 16 (5).png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Queue Villagers to Mining Camp</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                    <div class="h-[1px] bg-gray-400 w-full"></div>
                </div>
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 16 (4).png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Upgrade Double-Bit Axe</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                    <div class="h-[1px] bg-gray-400 w-full"></div>
                </div>
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 16 (9).png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Build 2 Archery Range</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                    <div class="h-[1px] bg-gray-400 w-full"></div>
                </div>
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 11.png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Queue Archers and Attack</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                    <div class="h-[1px] bg-gray-400 w-full"></div>
                </div>
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 16 (6).png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Build Houses and Constantly Build Walls Around Base</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="w-[976px] flex gap-[32px]">
        <div class="w-[80px] h-[80px] rounded-[12px] bg-gray-200 p-[24px] flex items-center justify-center">
            <span>24+</span>
        </div>        
        <div class="w-[864px] flex justify-start p-[32px] gap-[40px] rounded-[12px] bg-gray-200">
            <div class="w-full flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 16 (7).png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Queue Villagers and Build Farms</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                    <div class="h-[1px] bg-gray-400 w-full"></div>
                </div>
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 16 (8).png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Build Blacksmith and Upgrade Fletching</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="w-[976px] flex gap-[32px]">
        <div class="w-[80px] h-[80px] rounded-[12px] bg-gray-200 p-[24px] flex items-center justify-center">
            <span>40+</span>
        </div>        
        <div class="w-[864px] flex justify-start p-[32px] gap-[40px] rounded-[12px] bg-gray-200">
            <div class="w-full flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 11 (3).png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Queue Castle Age</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="w-[464px] flex items-center gap-[16px]">
        <div class="w-[80px] flex items-center]">
            <img class="w-[32px]" src="{{ asset('image/Rectangle 11 (3).png') }}" alt="Card image">
            <div class="w-[40px] h-[40px] rounded-tr-[8px] rounded-br-[8px] bg-gray-200 p-[4px] flex items-center justify-center">
                <h4 class="">12</h4>
            </div>
        </div>
        <div class="w-[80px] flex items-center]">
            <img class="w-[32px]" src="{{ asset('image/Rectangle 11 (3).png') }}" alt="Card image">
            <div class="w-[40px] h-[40px] rounded-tr-[8px] rounded-br-[8px] bg-gray-200 p-[4px] flex items-center justify-center">
                <h4 class="">12</h4>
            </div>
        </div>
        <div class="w-[80px] flex items-center]">
            <img class="w-[32px]" src="{{ asset('image/Rectangle 11 (3).png') }}" alt="Card image">
            <div class="w-[40px] h-[40px] rounded-tr-[8px] rounded-br-[8px] bg-gray-200 p-[4px] flex items-center justify-center">
                <h4 class="">12</h4>
            </div>
        </div>
        <div class="w-[80px] flex items-center]">
            <img class="w-[32px]" src="{{ asset('image/Rectangle 11 (3).png') }}" alt="Card image">
            <div class="w-[40px] h-[40px] rounded-tr-[8px] rounded-br-[8px] bg-gray-200 p-[4px] flex items-center justify-center">
                <h4 class="">12</h4>
            </div>
        </div>
        <div class="w-[80px] flex items-center]">
            <img class="w-[32px]" src="{{ asset('image/Rectangle 11 (3).png') }}" alt="Card image">
            <div class="w-[40px] h-[40px] rounded-tr-[8px] rounded-br-[8px] bg-gray-200 p-[4px] flex items-center justify-center">
                <h4 class="">12</h4>
            </div>
        </div>
        
    </div>
</div>

<div class="w-full flex flex-col gap-[32px] left-[64px] mt-9">
    <button class="w-[976px] rounded-[12px] flex items-center pt-[16px] pr-[32px] pb-[16px] pl-[32px] gap-[10px] bg-black">
        <div class="flex gap-[16px] items-center">
            <img src="{{ asset('image/Rectangle 24.png') }}" class="rounded-[12px] w-[48px]" alt="">
            <h3 class="leading-[40px] text-[36px] font-satoshi font-bold text-white">Castle Age</h3>
        </div>
    </button>

    <div class="w-[976px] flex gap-[32px]">
        <div class="w-[80px] h-[80px] rounded-[12px] bg-gray-200 p-[24px] flex items-center justify-center">
            <span>?</span>
        </div>        
        <div class="w-[864px] flex justify-start p-[32px] gap-[40px] rounded-[12px] bg-gray-200">
            <div class="w-full flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 11.png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Keep Producing Archers</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="w-full flex gap-[32px]">
        <div class="w-[80px] h-[80px] rounded-[12px] bg-gray-200 p-[24px] flex items-center justify-center">
            <span>41+</span>
        </div>        
        <div class="w-[864px] flex justify-start p-[32px] gap-[40px] rounded-[12px] bg-gray-200">
            <div class="w-full flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 16.png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Research Crossbow and Bodkin Arrow</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                    <div class="h-[1px] bg-gray-400 w-full"></div>
                </div>
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 16 (1).png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Upgrade Bow Saw</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                    <div class="h-[1px] bg-gray-400 w-full"></div>
                </div>
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 16 (2).png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Build University and Research Balistics</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                    <div class="h-[1px] bg-gray-400 w-full"></div>
                </div>
                <div class="flex flex-col gap-[32px] items-center">
                    <div class="flex flex-row gap-8">
                        <div class="flex-shrink-0">
                            <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 16 (3).png') }}" alt="Card image">
                        </div>
                        <div class="flex flex-col gap-[16px] w-full">
                            <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Optional: Build Extra Town Center</h4>
                                <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="container w-full flex flex-col top-[480px] pt-[80px] pr-[36px] pb-[80px] pl-[36px] gap-[40px]">
    <h3 class="w-[460px] text-[56px] leading-[64px] font-lato font-medium">OTHER INSIGHTS</h3>              
    <div class="w-full flex gap-[24px]">
        <div class="w-[672px] rounded-[12px] bg-gray-200 flex gap-[10px] p-[32px]">
            <div class="w-full flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex gap-[32px] items-center">
                    <div class="flex-shrink-0">
                        <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 11 (4).png') }}" alt="Card image">
                    </div>
                    <div class="flex flex-col gap-[16px]">
                        <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Arena Fast Imperial -> HC BBC</h4>
                        <div class="flex gap-[16px]">
                            <img src="{{ asset('image/Rectangle 12.png') }}" class="rounded-[8px] w-[24px]" alt="Advanced">
                            <span class="text-[18px] font-satoshi">Advanced</span>
                            <img src="{{ asset('image/Rectangle 12 (2).png') }}" class="rounded-[8px] w-[24px]" alt="19 Pop">
                            <span class="text-[18px] font-satoshi">32 Pop</span>
                        </div>
                    </div>
                </div>
                <div class="w-full">
                    <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                        Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                        Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                    </p>
                    <div class="w-[576px] flex gap-[12px]">
                        <button class="w-[123px] rounded-[60px] pt-[8px] pr-[16px] pb-[8px] pl-[16px] gap-[10px] bg-white hover:bg-gray-700 hover:text-white">
                            <span class="text-[18px] leading-[28px] font-satoshi w-[91px]">Build Order</span>
                        </button>
                        <button class="w-[125px] rounded-[60px] pt-[8px] pr-[16px] pb-[8px] pl-[16px] gap-[10px] bg-white hover:bg-gray-700 hover:text-white">
                            <span class="text-[18px] leading-[28px] font-satoshi w-[91px]">Generic Civ</span>
                        </button>
                        <button class="w-[85px] rounded-[60px] pt-[8px] pr-[16px] pb-[8px] pl-[16px] gap-[10px] bg-white hover:bg-gray-700 hover:text-white">
                            <span class="text-[18px] leading-[28px] font-satoshi w-[91px]">Archer</span>
                        </button>
                        <button class="w-[127px] rounded-[60px] pt-[8px] pr-[16px] pb-[8px] pl-[16px] gap-[10px] bg-white hover:bg-gray-700 hover:text-white">
                            <span class="text-[18px] leading-[28px] font-satoshi w-[91px]">Team Game</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="w-[672px] rounded-[12px] bg-gray-200 flex gap-[10px] p-[32px]">
            <div class="w-full flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex gap-[32px] items-center">
                    <div class="flex-shrink-0">
                        <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 11 (3).png') }}" alt="Card image">
                    </div>
                    <div class="flex flex-col gap-[16px]">
                        <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Land Nomad Fast Castle -> 3 TC Boom</h4>
                        <div class="flex gap-[16px]">
                            <img src="{{ asset('image/Rectangle 12 (1).png') }}" class="rounded-[8px] w-[24px]" alt="Advanced">
                            <span class="text-[18px] font-satoshi">Beginner</span>
                            <img src="{{ asset('image/Rectangle 12 (2).png') }}" class="rounded-[8px] w-[24px]" alt="19 Pop">
                            <span class="text-[18px] font-satoshi">25 Pop</span>
                        </div>
                    </div>
                </div>
                <div class="w-full">
                    <p class="font-satoshi text-[18px] leading-[28px] mb-[16px] text-gray-500">
                        Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                        Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                    </p>
                    <div class="w-[576px] flex gap-[12px]">
                        <button class="w-[123px] rounded-[60px] pt-[8px] pr-[16px] pb-[8px] pl-[16px] gap-[10px] bg-white hover:bg-gray-700 hover:text-white">
                            <span class="text-[18px] leading-[28px] font-satoshi w-[91px]">Build Order</span>
                        </button>
                        <button class="w-[125px] rounded-[60px] pt-[8px] pr-[16px] pb-[8px] pl-[16px] gap-[10px] bg-white hover:bg-gray-700 hover:text-white">
                            <span class="text-[18px] leading-[28px] font-satoshi w-[91px]">Generic Civ</span>
                        </button>
                        <button class="w-[85px] rounded-[60px] pt-[8px] pr-[16px] pb-[8px] pl-[16px] gap-[10px] bg-white hover:bg-gray-700 hover:text-white">
                            <span class="text-[18px] leading-[28px] font-satoshi w-[91px]">Archer</span>
                        </button>
                        <button class="w-[127px] rounded-[60px] pt-[8px] pr-[16px] pb-[8px] pl-[16px] gap-[10px] bg-white hover:bg-gray-700 hover:text-white">
                            <span class="text-[18px] leading-[28px] font-satoshi w-[91px]">Team Game</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="w-full flex justify-between items-center">
        <span id="prevButton" class="text-[60px] leading-[68px] font-satoshi w-[161px] text-gray-400 font-medium cursor-pointer">
            PREV
        </span>
        <div id="paginationContainer" class="flex items-center gap-[12px]">
        </div>
        <span id="nextButton" class="text-[60px] leading-[68px] font-satoshi w-[161px] text-black font-medium cursor-pointer">
            NEXT
        </span>
    </div>
</div>


<script>
    const totalPages = 8; 
    let currentPage = 1;

    function createButton(label, isActive = false, isDisabled = false) {
        const button = document.createElement("button");
        button.className =
            "w-[48px] rounded-full p-3 bg-gray-200 text-gray-600 hover:bg-black hover:text-white";
        if (isActive) {
            button.classList.add("bg-black", "text-white", "cursor-default");
            button.disabled = true;
        }
        if (isDisabled) {
            button.className = "w-[48px] rounded-full p-3 bg-gray-400 text-white cursor-default";
            button.disabled = true;
        }
        button.textContent = label;
        button.onclick = () => {
            if (!isDisabled) {
                currentPage = parseInt(label);
                renderPagination();
            }
        };
        return button;
    }

    function generatePages(totalPages, currentPage) {
        const pages = [];

        pages.push(1);

        if (currentPage > 3) {
            pages.push("...");
        }

        for (let i = Math.max(2, currentPage - 1); i <= Math.min(totalPages - 1, currentPage + 1); i++) {
            pages.push(i);
        }

        if (currentPage < totalPages - 2) {
            pages.push("...");
        }

        if (totalPages > 1) {
            pages.push(totalPages);
        }

        return pages;
    }

    function renderPagination() {
        const paginationContainer = document.getElementById("paginationContainer");
        paginationContainer.innerHTML = ""; 

        const pages = generatePages(totalPages, currentPage);

        pages.forEach((page) => {
            if (page === "...") {
                const ellipsis = createButton(page, false, true); 
                paginationContainer.appendChild(ellipsis);
            } else {
                const button = createButton(page, page === currentPage);
                paginationContainer.appendChild(button);
            }
        });

        const prevButton = document.getElementById("prevButton");
        const nextButton = document.getElementById("nextButton");

        prevButton.style.color = currentPage === 1 ? "gray" : "black";
        prevButton.style.cursor = currentPage === 1 ? "not-allowed" : "pointer";
        nextButton.style.color = currentPage === totalPages ? "gray" : "black";
        nextButton.style.cursor = currentPage === totalPages ? "not-allowed" : "pointer";

        prevButton.onclick = () => {
            if (currentPage > 1) {
                currentPage -= 1;
                renderPagination();
            }
        };

        nextButton.onclick = () => {
            if (currentPage < totalPages) {
                currentPage += 1;
                renderPagination();
            }
        };
    }

    renderPagination();

</script>


@endsection