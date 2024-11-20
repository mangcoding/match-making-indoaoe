<script src="https://cdn.tailwindcss.com"></script>
<link href="https://fonts.googleapis.com/css2?family=Satoshi:wght@100;300;400;700;900&display=swap" rel="stylesheet">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Satoshi:wght@100;300;400;700;900&display=swap');
</style>
<title>Insights</title>

@extends('layouts.frontend')

@section('content')
<div class="container flex flex-col items-center justify-center  min-h-screen w-full">
    <div class="flex items-center justify-center ">
        <h1 class="text-[280px] leading-[280px] font-black font-satoshi text-center">INSIGHTS</h1>
    </div>
</div>
<div class="container w-full flex flex-col top-[480px] pt-[80px] pr-[36px] pb-[80px] pl-[36px] gap-[40px]">
    <div class="w-full flex gap-[16px]">
        <button class="bg-white border-[1px] border-black rounded-[60px] w-[79px] flex pt-[12px] pr-[24px] pb-[12px] pl-[24px] gap-[10px] hover:bg-black hover:text-white">
            <span class="w-[119px] text-[18px] leading-[24px] font-lato font-normal">ALL</span>
        </button>
        <button class="bg-white border-[1px] border-black rounded-[60px] w-[167px] flex pt-[12px] pr-[24px] pb-[12px] pl-[24px] gap-[10px] hover:bg-black hover:text-white">
            <span class="w-[119px] text-[18px] leading-[24px] font-lato font-normal">BUILD ORDER</span>
        </button>
        <button class="bg-white border-[1px] border-black rounded-[60px] w-[157px] flex pt-[12px] pr-[24px] pb-[12px] pl-[24px] gap-[10px] hover:bg-black hover:text-white">
            <span class="w-[119px] text-[18px] leading-[24px] font-lato font-normal">TIPS & TRICK</span>
        </button>
    </div>
    
    
    <div class="w-full flex gap-[24px]">
        <div class="w-[672px] rounded-[12px] bg-gray-200 flex gap-[10px] p-[32px]">
            <div class="w-full max-w-[567px] flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex gap-[32px] items-center">
                    <div class="flex-shrink-0">
                        <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 11.png') }}" alt="Card image">
                    </div>
                    <div class="flex flex-col gap-[16px]">
                        <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Arabia Fast Feudal -> Archer Rush</h4>
                        <div class="flex gap-[16px]">
                            <img src="{{ asset('image/Rectangle 12.png') }}" class="rounded-[8px] w-[24px]" alt="Advanced">
                            <span class="text-[18px] font-satoshi">Advanced</span>
                            <img src="{{ asset('image/Rectangle 12 (2).png') }}" class="rounded-[8px] w-[24px]" alt="19 Pop">
                            <span class="text-[18px] font-satoshi">19 Pop</span>
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
            <div class="w-full max-w-[567px] flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex gap-[32px] items-center">
                    <div class="flex-shrink-0">
                        <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 113.png') }}" alt="Card image">
                    </div>
                    <div class="flex flex-col gap-[16px]">
                        <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Arabia Fast Feudal -> Scout Rush</h4>
                        <div class="flex gap-[16px]">
                            <img src="{{ asset('image/Rectangle 123.png') }}" class="rounded-[8px] w-[24px]" alt="Advanced">
                            <span class="text-[18px] font-satoshi">Intermediate</span>
                            <img src="{{ asset('image/Rectangle 12 (2).png') }}" class="rounded-[8px] w-[24px]" alt="19 Pop">
                            <span class="text-[18px] font-satoshi">20 Pop</span>
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
    
    

    <div class="w-full flex gap-[24px]">
        <div class="w-[672px] rounded-[12px] bg-gray-200 flex gap-[10px] p-[32px]">
            <div class="w-full max-w-[567px] flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex gap-[32px] items-center">
                    <div class="flex-shrink-0">
                        <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 11 (1).png') }}" alt="Card image">
                    </div>
                    <div class="flex flex-col gap-[16px]">
                        <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Land Nomad Fast Castle -> Knight Rush</h4>
                        <div class="flex gap-[16px]">
                            <img src="{{ asset('image/Rectangle 12 (1).png') }}" class="rounded-[8px] w-[24px]" alt="Advanced">
                            <span class="text-[18px] font-satoshi">Beginner</span>
                            <img src="{{ asset('image/Rectangle 12 (2).png') }}" class="rounded-[8px] w-[24px]" alt="19 Pop">
                            <span class="text-[18px] font-satoshi">23 Pop</span>
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
            <div class="w-full max-w-[567px] flex flex-col gap-[32px] justify-start pt-[20px]">
                <div class="flex gap-[32px] items-center">
                    <div class="flex-shrink-0">
                        <img class="w-[120px] rounded-[12px]" src="{{ asset('image/Rectangle 11 (2).png') }}" alt="Card image">
                    </div>
                    <div class="flex flex-col gap-[16px]">
                        <h4 class="text-[30px] leading-[36px] font-satoshi font-medium">Nomad Fast Feudal -> Galley</h4>
                        <div class="flex gap-[16px]">
                            <img src="{{ asset('image/Rectangle 123.png') }}" class="rounded-[8px] w-[24px]" alt="Advanced">
                            <span class="text-[18px] font-satoshi">Intermediate</span>
                            <img src="{{ asset('image/Rectangle 12 (2).png') }}" class="rounded-[8px] w-[24px]" alt="19 Pop">
                            <span class="text-[18px] font-satoshi">18 Pop</span>
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

    
    <div class="w-full flex gap-[24px]">
        <div class="w-[672px] rounded-[12px] bg-gray-200 flex gap-[10px] p-[32px]">
            <div class="w-full max-w-[567px] flex flex-col gap-[32px] justify-start pt-[20px]">
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
            <div class="w-full max-w-[567px] flex flex-col gap-[32px] justify-start pt-[20px]">
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