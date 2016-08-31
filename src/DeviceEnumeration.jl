# Device Enumeration API

function enumDevices(enumfilter::ENUMFILTER = ENUMFILTERALL)
  x = Ref{Cint}(0)
  succ = ccall((:FDwfEnum,libdwf),Cint,(Cint,Ptr{Cint}),
    enumfilter,x)
  succ == 0 && error("Error calling FDwfEnum.")
  return x[]
end

function enumDeviceType(idxDevice::Int32)
  deviceId = Ref{Cint}(0)
  deviceRevision = Ref{Cint}(0)
  succ = ccall((:FDwfEnumDeviceType,libdwf),Cint,(Cint,Ptr{Cint},Ptr{Cint}),
    idxDevice,deviceId,deviceRevision)
  succ == 0 && error("Error calling FDwfEnumDeviceType.")
  return (DEVID(deviceId[]),DEVVER(deviceRevision[]))
end

function enumDeviceIsOpened(idxDevice::Int32)
  x = Ref{Cint}(0)
  succ = ccall((:FDwfEnumDeviceIsOpened,libdwf),Cint,(Cint,Ptr{Cint}),
    idxDevice,x)
  succ == 0 && error("Error calling FDwfEnumDeviceIsOpened.")
  return x[]
end

function enumUserName(idxDevice::Int32)
  userName = Vector{UInt8}(32)
  succ = ccall((:FDwfEnumUserName,libdwf),Cint,(Cint,Ptr{UInt8}),
    idxDevice,userName)
  succ == 0 && error("Error calling FDwfEnumUserName.")
  return String(copy(userName))
end

function enumDeviceName(idxDevice::Int32)
  deviceName = Vector{UInt8}(32)
  succ = ccall((:FDwfEnumDeviceName,libdwf),Cint,(Cint,Ptr{UInt8}),
    idxDevice,deviceName)
  succ == 0 && error("Error calling FDwfEnumDeviceName.")
  return String(copy(deviceName))
end

function enumSN(idxDevice::Int32)
  sn = Vector{UInt8}(32)
  succ = ccall((:FDwfEnumSN,libdwf),Cint,(Cint,Ptr{UInt8}),
    idxDevice,sn)
  succ == 0 && error("Error calling FDwfEnumSN.")
  return String(copy(sn))
end

function enumConfig(idxDevice::Int32)
  x = Ref{Cint}(0)
  succ = ccall((:FDwfEnumConfig,libdwf),Cint,(Cint,Ptr{Cint}),
    idxDevice,x)
  succ == 0 && error("Error calling FDwfEnumConfig.")
  return x[]
end

function enumConfigInfo(idxConfig::Int32,infoType::DWFENUMCONFIGINFO)
  x = Ref{Cint}(0)
  succ = ccall((:FDwfEnumConfigInfo,libdwf),Cint,(Cint,Cint,Ptr{Cint}),
    idxConfig,infoType,x)
  succ == 0 && error("Error calling FDwfEnumConfigInfo.")
  return x[]
end
