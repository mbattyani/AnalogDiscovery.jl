module AnalogDiscovery

const libdwf = Libdl.find_library("libdwf.so")

include("DwfTypes.jl")
export Hdwf
for s in instances(ENUMFILTER)
    @eval export $(Symbol(s))
end

include("DeviceEnumeration.jl")
include("AnalogIn.jl")

end # module
