# Device Enumeration API

function enumDevices(enumfilter::EnumFilter = ENUMFILTERALL)
  x::Int32 = 0
  succ = ccall((:FDwfEnum,libdwf),Cint,(Cint,Ptr{Cint}),
    enumfilter,pointer_from_objref(x))
  succ != 1 && error("Error calling FDwfEnum.")
  return x
end
