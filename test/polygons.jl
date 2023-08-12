@testset "polygons.jl" begin
    # The main box
    p1 = box(10.0, 10.0, 20.0, 20.0)
    # A box fully inside

    p2 = box(12.0, 12.0, 18.0, 18.0)

    # A box with one corner inside
    p3 = box(18.0, 18.0, 22.0, 22.0)

    @test intersects(p1, p2) == false
    @test intersects(p1, p3) == true

    
end