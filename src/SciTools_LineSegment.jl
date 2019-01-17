"""
    `LineSegment(r1,r2)`

# ARGUMENTS
* `r1::Array{Float64}`        : Starting point of panel
* `r2::Array{Float64}`        : Ending point of panel

# PROPERTIES
* `r1::Array{Float64}`        : Starting point of segment
* `r2::Array{Float64}`        : Ending point of segment
* `L::Float64`                : Length of segment
* `theta::Float64`            : Angle of panel relative to global X-axis (2D ONLY)
* `n_hat::Array{Float64}`     : Normal vector (2D ONLY)
* `t_hat::Array{Float64}`     : Tangent vector
"""
mutable struct LineSegment

    # -- Properties --
    R1::Array{Number}
    R2::Array{Number}
    L::Number
    theta::Number
    n_hat::Array{Number}
    t_hat::Array{Number}

    # -- Constructor --
    function LineSegment(r1::Array{Number},r2::Array{Number})

        if length(r1) == 2
            x1, y1 = r1[1], r1[2]
            x2, y2 = r2[1], r2[2]

            L = sqrt((y2 - y1)^2 + (x2 - x1)^2)
            theta = atan((y2 - y1),(x2 - x1))

            t_hat = (r2 - r1)/norm(r2 - r1)
            n_hat = [t_hat[2],-t_hat[1]]

        elseif length(r1) == 3
            x1, y1, z1 = r1[1], r1[2], r1[3]
            x2, y2, z2 = r2[1], r2[2], r2[3]

            L = sqrt((z2 - z1)^2 + (y2 - y1)^2 + (x2 - x1)^2)
            theta = 0.0

            t_hat = (r2 - r1)/norm(r2 - r1)
            n_hat = [0.0, 0.0, 0.0]

        end

        new(r1,r2,L,theta,n_hat,t_hat)
    end
end
