module WorkingGeoMakieCombo

using GeoMakie, Makie
export testmap1, testmap2

function testmap1()
    lons = LinRange(-179.5, 179.5, 360)
    lats = LinRange(-89.5, 89.5, 180)

    field = [exp(cosd(l)) + 3(y/90) for l in lons, y in lats]

    source = LonLat()
    dest = WinkelTripel()

    xs, ys = xygrid(lons, lats)
    Proj4.transform!(source, dest, vec(xs), vec(ys))

    scene = surface(xs, ys; color = field, shading = false, show_axis = false, scale_plot = false)

    geoaxis!(scene, extrema(lons), extrema(lats); crs = (src = source, dest = dest,))

    # coastlines!(scene; crs = (src = source, dest = dest,))
end

function testmap2()
    lons = LinRange(1, 30, 360)
    lats = LinRange(51, 74, 180)

    field = [exp(cosd(l)) + 3(y/90) for l in lons, y in lats]

    source = LonLat()
    dest = WinkelTripel()

    xs, ys = xygrid(lons, lats)
    Proj4.transform!(source, dest, vec(xs), vec(ys))

    scene = surface(xs, ys; color = field, shading = false, show_axis = false, scale_plot = false)

    geoaxis!(scene, extrema(lons), extrema(lats); crs = (src = source, dest = dest,))

    # coastlines!(scene; crs = (src = source, dest = dest,))
end

end # module
