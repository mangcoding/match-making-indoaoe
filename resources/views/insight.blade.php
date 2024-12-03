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

        <!-- Card 2 -->
        {{-- <div class="w-[100%] lg:w-[60%]  rounded-[12px] bg-gray-200 flex gap-[10px] p-[16px] lg:p-[32px]">
            <div class="w-full max-w-[567px] flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex gap-[32px] items-center">
                    <div class="flex-shrink-0">
                        <img class="w-[100px] md:w-[120px] sm:w-[10px] rounded-[12px]" src="{{ asset('image/Rectangle 113.png') }}" alt="Card image">
                    </div>
                    <div class="flex flex-col gap-[16px]">
                        <h4 class="text-[14px] sm:text-[16px] md:text-[18px] lg:text-[20px] xl:text-[30px] leading-[20px] sm:leading-[22px] md:leading-[26px] lg:leading-[30px] xl:leading-[36px] font-satoshi font-medium">
                            Arabia Fast Feudal -> Scout Rush
                        </h4>
                        <div class="flex gap-2 flex-col md:flex-row lg:flex-row">
                            <div class="flex gap-1">
                                <div class="w-6 h-6 bg-amber-500 rounded-[8px] flex flex-col md:flex-row lg:flex-row"></div>
                                <span class="text-[13px] sm:text-[14px] lg:text-[16px] font-satoshi flex flex-col md:flex-row lg:flex-row">Intermediate</span>
                            </div>
                            <div class="flex gap-1">
                                <img src="{{ asset('image/Rectangle 28.png') }}" class="rounded-[8px] w-6 h-6 flex flex-col md:flex-row lg:flex-row" alt="19 Pop">
                                <span class="text-[13px] sm:text-[14px] lg:text-[16px] font-satoshi flex flex-col md:flex-row lg:flex-row">20 Pop</span>
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
        </div> --}}
</div>

    {{-- <div class="w-full flex flex-col md:flex-row lg:flex-row gap-10 md:gap-5">
        <div class="w-[100%] lg:w-[60%]  rounded-[12px] bg-gray-200 flex gap-[10px] p-[16px] lg:p-[32px]">
            <div class="w-full max-w-[567px] flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex gap-[32px] items-center">
                    <div class="flex-shrink-0">
                        <img class="w-[100px] md:w-[120px] sm:w-[10px] rounded-[12px]" src="{{ asset('image/Rectangle 11 (2).png') }}" alt="Card image">
                    </div>
                    <div class="flex flex-col gap-[16px]">
                        <h4 class="text-[14px] sm:text-[16px] md:text-[18px] lg:text-[20px] xl:text-[30px] leading-[20px] sm:leading-[22px] md:leading-[26px] lg:leading-[30px] xl:leading-[36px] font-satoshi font-medium">
                            Land Nomad Fast Castle -> Knight Rush
                        </h4>
                        <div class="flex gap-2 flex-col md:flex-row lg:flex-row">
                            <div class="flex gap-1">
                                <div class="w-6 h-6 bg-green-500 rounded-[8px] flex flex-col md:flex-row lg:flex-row"></div>
                                <span class="text-[13px] sm:text-[14px] lg:text-[16px] font-satoshi flex flex-col md:flex-row lg:flex-row">Beginner</span>
                            </div>
                            <div class="flex gap-1">
                                <img src="{{ asset('image/Rectangle 28.png') }}" class="rounded-[8px] w-6 h-6 flex flex-col md:flex-row lg:flex-row" alt="19 Pop">
                                <span class="text-[13px] sm:text-[14px] lg:text-[16px] font-satoshi flex flex-col md:flex-row lg:flex-row">23 Pop</span>
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

        <div class="w-[100%] lg:w-[60%]  rounded-[12px] bg-gray-200 flex gap-[10px] p-[16px] lg:p-[32px]">
            <div class="w-full max-w-[567px] flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex gap-[32px] items-center">
                    <div class="flex-shrink-0">
                        <img class="w-[100px] md:w-[120px] sm:w-[10px] rounded-[12px]" src="{{ asset('image/Rectangle 11 (1).png') }}" alt="Card image">
                    </div>
                    <div class="flex flex-col gap-[16px]">
                        <h4 class="text-[14px] sm:text-[16px] md:text-[18px] lg:text-[20px] xl:text-[30px] leading-[20px] sm:leading-[22px] md:leading-[26px] lg:leading-[30px] xl:leading-[36px] font-satoshi font-medium">
                            Nomad Fast Feudal -> Galley
                        </h4>
                        <div class="flex gap-2 flex-col md:flex-row lg:flex-row">
                            <div class="flex gap-1">
                                <div class="w-6 h-6 bg-amber-500 rounded-[8px] flex flex-col md:flex-row lg:flex-row"></div>
                                <span class="text-[13px] sm:text-[14px] lg:text-[16px] font-satoshi flex flex-col md:flex-row lg:flex-row">Intermediate</span>
                            </div>
                            <div class="flex gap-1">
                                <img src="{{ asset('image/Rectangle 28.png') }}" class="rounded-[8px] w-6 h-6 flex flex-col md:flex-row lg:flex-row" alt="19 Pop">
                                <span class="text-[13px] sm:text-[14px] lg:text-[16px] font-satoshi flex flex-col md:flex-row lg:flex-row">18 Pop</span>
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
    </div>

    <div class="w-full flex flex-col md:flex-row lg:flex-row gap-10 md:gap-5">
        <div class="w-[100%] lg:w-[60%]  rounded-[12px] bg-gray-200 flex gap-[10px] p-[16px] lg:p-[32px]">
            <div class="w-full max-w-[567px] flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex gap-[32px] items-center">
                    <div class="flex-shrink-0">
                        <img class="w-[100px] md:w-[120px] sm:w-[10px] rounded-[12px]" src="{{ asset('image/Rectangle 11 (4).png') }}" alt="Card image">
                    </div>
                    <div class="flex flex-col gap-[16px]">
                        <h4 class="text-[14px] sm:text-[16px] md:text-[18px] lg:text-[20px] xl:text-[30px] leading-[20px] sm:leading-[22px] md:leading-[26px] lg:leading-[30px] xl:leading-[36px] font-satoshi font-medium">
                            Arena Fast Imperial -> HC BBC
                        </h4>
                        <div class="flex gap-2 flex-col md:flex-row lg:flex-row">
                            <div class="flex gap-1">
                                <div class="w-6 h-6 bg-red-700 rounded-[8px] flex flex-col md:flex-row lg:flex-row"></div>
                                <span class="text-[12px] sm:text-[14px] lg:text-[16px] font-satoshi flex flex-col md:flex-row lg:flex-row">Advanced</span>
                            </div>
                            <div class="flex gap-1">
                                <img src="{{ asset('image/Rectangle 28.png') }}" class="rounded-[8px] w-6 h-6 flex flex-col md:flex-row lg:flex-row" alt="19 Pop">
                                <span class="text-[13px] sm:text-[14px] lg:text-[16px] font-satoshi flex flex-col md:flex-row lg:flex-row">32 Pop</span>
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

        <div class="w-[100%] lg:w-[60%]  rounded-[12px] bg-gray-200 flex gap-[10px] p-[16px] lg:p-[32px]">
            <div class="w-full max-w-[567px] flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex gap-[32px] items-center">
                    <div class="flex-shrink-0">
                        <img class="w-[100px] md:w-[120px] sm:w-[10px] rounded-[12px]" src="{{ asset('image/Rectangle 11 (3).png') }}" alt="Card image">
                    </div>
                    <div class="flex flex-col gap-[16px]">
                        <h4 class="text-[14px] sm:text-[16px] md:text-[18px] lg:text-[20px] xl:text-[30px] leading-[20px] sm:leading-[22px] md:leading-[26px] lg:leading-[30px] xl:leading-[36px] font-satoshi font-medium">
                            Land Nomad Fast Castle -> 3 TC Boom
                        </h4>
                        <div class="flex gap-2 flex-col md:flex-row lg:flex-row">
                            <div class="flex gap-1">
                                <div class="w-6 h-6 bg-green-500 rounded-[8px] flex flex-col md:flex-row lg:flex-row"></div>
                                <span class="text-[13px] sm:text-[14px] lg:text-[16px] font-satoshi flex flex-col md:flex-row lg:flex-row">Beginner</span>
                            </div>
                            <div class="flex gap-1">
                            <img src="{{ asset('image/Rectangle 28.png') }}" class="rounded-[8px] w-6 h-6 flex flex-col md:flex-row lg:flex-row" alt="19 Pop">
                            <span class="text-[13px] sm:text-[14px] lg:text-[16px] font-satoshi flex flex-col md:flex-row lg:flex-row">25 Pop</span>
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
    </div> --}}

    {{-- <div class="w-full flex justify-between items-center flex-row md:flex-row lg:flex-row">
        <span id="prevButton" class="text-2xl md:text-2xl xl:text-6xl leading-[68px] font-satoshi w-[161px] text-gray-400 font-medium cursor-pointer">
            PREV
        </span>
        <div id="paginationContainer" class="flex items-center gap-1 sm-gap-2 md:gap-6 lg:gap-3">
        </div>
        <span id="nextButton" class="text-2xl md:text-2xl xl:text-6xl leading-[68px] font-satoshi w-[161px] text-black font-medium cursor-pointer  -mr-20">
            NEXT
        </span>
    </div> --}}

</div>

@section('scripts')
@parent
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


@endsection
