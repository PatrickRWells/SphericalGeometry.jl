export intersects

function intersects(polygon1::Polygon, polygon2::Polygon)
    """
    Check whether the edges of two polgyons intersect.
    4 possible cases
    
    1. One polygon entirely contains the other -> return false
    3. One polygon contains at least one, but not all, points of the other
        polygon, return true
    4. (the hard case) the polygons intersect just on edges
    """
    if isinside(polygon1, polygon2) || isinside(polygon2, polygon1)
        return false
    end

    # Note, we loop twice here because we only need a single
    # point to be inside the other polygon to return true
    # So this will in general be more efficient than
    # computing this for all points

    for point in polygon1.points
        if isinside(point, polygon2)
            return true
        end
    end

    for point in polygon2.points
        if isinside(point, polygon1)
            return true
        end
    end

    # If we get here, we need to check for edge intersections    

    for edge1 in polygon1.edges
        for edge2 in polygon2.edges
            if intersects(edge1, edge2)
                return true
            end
        end
    end

    arcs1 = arcs(polygon1.points)
    arcs2 = arcs(polygon2.points)

    for arc1 in arcs1
        for arc2 in arcs2
            if intersects(arc1, arc2)
                return true
            end
        end
    end

    return false
end
