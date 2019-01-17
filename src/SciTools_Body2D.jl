"""
    `Body2D(X,Y)`

[insert description here]

# ARGUMENTS
* `X::Array{Float64}`           : List of X body points
* `Y::Array{Float64}`           : List of Y body points

# OUTPUTS
* `body::Array{LineSegment}`      : Array of Panel2D objects representing a body
"""
function Body2D(X::Array{Float64},
                Y::Array{Float64})

    # Iterate around body to create geometry
    NPTS = length(X)
    NPAN = NPTS - 1
    body = Array{LineSegment}(NPAN)
    for n=1:NPTS-1
        r1 = [X[n];Y[n]]
        r2 = [X[n+1];Y[n+1]]
        body[n] = LineSegment(r1,r2)
    end
    return body
end
