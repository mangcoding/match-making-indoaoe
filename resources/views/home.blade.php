<div class="container mx-auto px-4 py-8">

    <!-- Section Crafting -->
    @if(isset($formattedData['Section_crafting']))
        <div class="mb-8">
            <h2 class="text-2xl font-bold text-gray-800 mb-2">{{ $formattedData['Section_crafting']['title'] }}</h2>
            <p class="text-gray-600">{{ $formattedData['Section_crafting']['description'] }}</p>
        </div>
    @endif

    <!-- Section Youtube -->
    @if(isset($formattedData['Section Youtube']))
        <div class="mb-8">
            <h2 class="text-2xl font-bold text-gray-800 mb-2">{{ $formattedData['Section Youtube']['label'] }}</h2>
            <iframe class="w-full h-64" src="{{ $formattedData['Section Youtube']['link'] }}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
        </div>
    @endif

    <!-- Section Get to Know -->
    @if(isset($formattedData['Section Get to Know']))
        <div class="mb-8">
            <h2 class="text-2xl font-bold text-gray-800 mb-2">{{ $formattedData['Section Get to Know']['title'] }}</h2>
            <p class="text-gray-600">{{ $formattedData['Section Get to Know']['description'] }}</p>
        </div>
    @endif

    <!-- Section UI UX -->
    @if(isset($formattedData['Section UI UX']))
        <div class="mb-8">
            <h2 class="text-2xl font-bold text-gray-800 mb-2">{{ $formattedData['Section UI UX']['title'] }}</h2>
            <p class="text-gray-600 mb-4">{{ $formattedData['Section UI UX']['description'] }}</p>
            <a href="{{ $formattedData['Section UI UX']['link'] }}" class="inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                {{ $formattedData['Section UI UX']['label'] }}
            </a>
        </div>
    @endif

</div>
