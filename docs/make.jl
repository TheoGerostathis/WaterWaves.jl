using Documenter, WaterWaves

makedocs(;
    modules=[WaterWaves],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/TheoGerostathis/WaterWaves.jl/blob/{commit}{path}#L{line}",
    sitename="WaterWaves.jl",
    authors="Theodoros Gerostathis",
    assets=String[],
)

deploydocs(;
    repo="github.com/TheoGerostathis/WaterWaves.jl",
)
