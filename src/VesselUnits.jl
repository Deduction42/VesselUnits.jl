"""
    Package VesselUnits v$(pkgversion(VesselUnits))

Customized version of FlexUnits.jl for pressure vessel development.
"""
module VesselUnits

# Names exported from this package
export inch, mm, lb, kg, lbf, °F, °C, psi, MPa, kPa, bar, atm, STEEL_DENSITY
#export @u_str, @ud_str, @q_str, @U_str, @D_str, uparse, qparse, utype, dtype  # Copied from https://discourse.julialang.org/t/how-to-add-dimensions-in-flexunits/138886/2

# Load and reexport dependencies
using Reexport
@reexport using FlexUnits
@reexport using .UnitRegistry

# # Load Default Unit Registry
# using .RegistryTools
# const UNITS = PermanentDict{Symbol, Units{Dimensions{FixRat32}, AffineTransform}}()
# registry_defaults!(UNITS)
# const PREFERRED_UNITS = [UNITS[u] for u in [:F, :H, :T, :Ω, :V, :W, :J, :Pa, :N, :C, :L]]
# RegistryTools.complexity_sort!(PREFERRED_UNITS)
# RegistryTools.preferred_units(::Type{<:Dimensions}) = PREFERRED_UNITS
# @generate_registry_exports(UNITS)

# Add units
register_unit("atm" => 101.325 * u"kPa")

# Define selected units in namespace
const inch = u"inch" # Imperial Length
const mm = u"mm"     # Metric Length
const lb = u"lb"     # Imperial Mass
const kg = u"kg"     # Metric Mass
const lbf = u"lbf"   # Imperial Force
# N is too common    # Metric Force
const °F = u"°F"     # Imperial Temperature
const °C = u"°C"     # Metric Temperature
const psi = u"psi"   # Imperial Pressure
const MPa = u"MPa"   # Metric Pressure
const kPa = u"kPa"   # Alternate Metric Pressure
const bar = u"bar"   # Alternate Metric Pressure
const atm = u"atm"   # Alternate Metric Pressure

# Define important constants in namespace
const STEEL_DENSITY = 0.28lb/inch^3;

# Set preferred units for simplification
set_preferred_unit(inch)
set_preferred_unit(lb)
set_preferred_unit(lbf)
#set_preferred_unit(°F)  # ERROR: NotScalarError: °F cannot be treated as scalar, operation only valid for scalar units
set_preferred_unit(psi)
set_preferred_unit(u"psi")
set_preferred_unit(lb/inch^3)

display_simplified_units(true)  # Always convert to simple preferred units

end
