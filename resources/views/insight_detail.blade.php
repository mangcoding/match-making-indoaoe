@extends('layouts.frontend')
@section('content')
<div class="container mx-auto rounded-[12px] bg-black flex flex-col lg:flex-row relative">
    <div class="w-full lg:w-2/3 sm:text-center sm:mt-40 text-left">
        <h3 class="text-white leading-[40px] text-2xl sm:text-3xl md:text-3xl lg:text-4xl font-satoshi font-medium">
            Arabia Fast Feudal -> Archer Rush
        </h3>
        <span class="text-red-700 leading-[40px] text-xl sm:text-2xl md:text-[28px] lg:text-[32px] font-lato font-normal mt-[16px]">
            Build by IndoAoe Community
        </span>
    </div>
    <img src="{{ asset('image/Rectangle 11.png') }}" class="rounded-[12px] w-full lg:w-1/3" alt="">
</div>

<div class="container px-4 md:px-0 mx-auto">
    <div class="flex flex-col mx-auto">
        <h2 class="text-xl sm:text-5xl leading-[48px] font-satoshi font-medium py-6">Arabia Fast Feudal -> Archer Rush</h2>
        <div class="flex flex-col sm:flex-row">
            <p class="text-gray-400 text-base sm:text-xl w-full sm:w-[976px]">
                Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad. Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
            </p>
            <span class="text-red-600 text-sm sm:text-lg w-full ml-0 sm:ml-36 sm:w-40 gap-4 sm:gap-0">SHARE THIS BUILD!</span>
        </div>
    </div>
    <div class="w-full xl:w-9/12 flex flex-col gap-[32px] mt-9">
        @for ($i =0; $i < 3; $i++)
        <button class="sm:w-full rounded-xl flex items-center pt-4 pr-8 pb-4 pl-8 gap-2 bg-black sm:pt-3 sm:pr-6 sm:pb-3 sm:pl-6 sm:gap-2 md:pt-4 md:pr-8 md:pb-4 md:pl-8 md:gap-3">
            <div class="flex gap-4 items-center justify-center">
                <img src="{{ asset('image/Rectangle 26.png') }}" class="rounded-[12px] w-12 md:w-10 sm:w-7 flex md:flex-row" alt="">
                <h3 class="leading-10 text-2xl font-satoshi font-bold text-white md:text-4xl sm:text-2xl md:leading-8 sm:leading-8">Dark Age</h3>
            </div>
        </button>
        <div class="w-full">
            <div class="flex gap-4 sm:flex-row sm:gap-8">
                <div class="w-2/12 h-10 rounded-xl bg-gray-200 flex items-center justify-center sm:w-20 sm:h-20">
                    <h5>3</h5>
                </div>
                <div class="w-full flex justify-start p-4 gap-4 rounded-xl bg-gray-200 sm:flex-row sm:p-8 sm:gap-10">
                    <div class="w-full flex flex-col gap-4 sm:flex-col pt-0 sm:gap-8 sm:pt-5">
                        <div class="flex flex-col gap-4 items-center sm:gap-8 sm:flex-col">
                            <div class="flex flex-col md:flex-row gap-4 sm:gap-8">
                                <img class="rounded-xl w-full md:w-1/5 max-h-40 object-top object-cover md:object-cover md:object-center" src="{{ asset('image/Rectangle 28.png') }}" alt="">
                                <div class="flex flex-col gap-4 w-full">
                                    <h4 class="text-xl leading-5 font-satoshi font-medium sm:text-3xl sm:leading-9">Queue Villagers</h4>
                                    <p class="font-satoshi text-base leading-2 mb-4 text-gray-500 sm:text-lg sm:leading-7">
                                        Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                        Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                    </p>
                                </div>
                            </div>
                            <div class="h-[1px] bg-gray-400 w-full"></div>
                        </div>
                        <div class="flex flex-col gap-4 items-center sm:gap-8 sm:flex-col">
                            <div class="flex flex-col md:flex-row gap-4 sm:gap-8">
                                <img class="rounded-xl w-full md:w-1/5 max-h-40 object-top object-cover md:object-cover md:object-center" src="{{ asset('image/Rectangle 16 (6).png') }}" alt="">
                                <div class="flex flex-col gap-4 w-full">
                                    <h4 class="text-xl leading-5 font-satoshi font-medium sm:text-3xl sm:leading-9">Build 2 Houses</h4>
                                    <p class="font-satoshi text-base leading-2 mb-4 text-gray-500 sm:text-lg sm:leading-7">
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
        <div class="w-full flex gap-4 sm:flex-row sm:gap-8">
            <div class="w-2/12 h-10 rounded-xl bg-gray-200 flex items-center justify-center sm:w-20 sm:h-20">
                <h5>4-6</h5>
            </div>
            <div class="w-full flex justify-start p-4 gap-4 rounded-xl bg-gray-200 sm:flex-row sm:p-8 sm:gap-10">
                <div class="w-full flex flex-col gap-4 sm:flex-col pt-0 sm:gap-8 sm:pt-5">
                    <div class="flex flex-col gap-4 items-center sm:gap-8 sm:flex-col">
                        <div class="flex flex-col md:flex-row gap-4 sm:gap-8">
                            <img class="rounded-xl w-full md:w-1/5 max-h-40 object-top object-cover md:object-cover md:object-center" src="{{ asset('image/Rectangle 29.png') }}" alt="Card image">
                            <div class="flex flex-col gap-4 w-full">
                                <h4 class="text-xl leading-5 font-satoshi font-medium sm:text-3xl sm:leading-9">6 on Sheep</h4>
                                <p class="font-satoshi text-base leading-2 mb-4 text-gray-500 sm:text-lg sm:leading-7">
                                    Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad.
                                    Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @endfor
    </div>
</div>
<div class="w-full flex flex-col top-[480px] pt-20 pr-9 pb-20 pl-9 gap-10">
        <h3 class="font-lato font-medium text-3xl md:text-4xl xl:text-6xl">OTHER INSIGHTS</h3>
    <div class="w-full grid grid-cols-1 md:grid-cols-2  gap-10 md:gap-5">
        @for ($i =0; $i < 2; $i++)
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
                            <span class="text-[16px] lg:text-[18px] leading-[24px] lg:leading-[28px] font-satoshi">Turks</span>
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
