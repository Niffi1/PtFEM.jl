using Compat, CSoM, Base.Test

include(Pkg.dir("CSoM", "examples", "StaticEquilibrium", "FE4_7.jl"))

data = @compat Dict(
  # Plane(ndim, nst, nxe, nye, nip, direction, finite_element(nod, nodof), axisymmetric)
  :element_type => Plane(2, 3, 2, 2, 16, :x, Quadrilateral(4, 4), false),
  :properties => [10.92 0.3;],
  :x_coords => linspace(0.0, 0.5, 3),
  :y_coords => linspace(0.0, 0.5, 3),
  :thickness => 1.0,
  :support => [
    (1, [0 0 0 1]),
    (2, [0 0 1 1]),
    (3, [0 0 1 0]),
    (4, [0 1 0 1]),
    (6, [1 0 1 0]),
    (7, [0 1 0 0]),
    (8, [1 1 0 0]),
    (9, [1 0 0 0])
    ],
  :loaded_nodes => [
    (9, [0.25 0.0 0.0 0.0])
    ]
)


@time m = FE4_7(data)

@test_approx_eq_eps m [-0.12113940612422724,-0.12113940612422731,-0.033472050966241285] eps()