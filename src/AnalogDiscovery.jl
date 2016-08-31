module AnalogDiscovery

@static if is_unix()
  const libdwf = Libdl.find_library("libdwf.so")
end

@static if is_windows()
  const libdwf = Libdl.find_library("dwf.dll")
end

include("DwfTypes.jl")
export Hdwf
for s in instances(ENUMFILTER)
    @eval export $(Symbol(s))
end

include("DeviceEnumeration.jl")
include("AnalogIn.jl")

end # module
