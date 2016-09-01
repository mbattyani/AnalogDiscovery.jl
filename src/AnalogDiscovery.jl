module AnalogDiscovery

@static if is_unix()
  const libdwf = Libdl.find_library("libdwf.so")
end

@static if is_windows()
  const libdwf = Libdl.find_library("dwf.dll")
end

include("DwfTypes.jl")
export Hdwf
export ENUMFILTER
for s in instances(ENUMFILTER)
    @eval export $(Symbol(s))
end
export DEVID
for s in instances(DEVID)
    @eval export $(Symbol(s))
end
export DEVVER
for s in instances(DEVVER)
    @eval export $(Symbol(s))
end
export DWFENUMCONFIGINFO
for s in instances(DWFENUMCONFIGINFO)
    @eval export $(Symbol(s))
end
export DWFSTATE
for s in instances(DWFSTATE)
    @eval export $(Symbol(s))
end
export ACQMODE
for s in instances(ACQMODE)
    @eval export $(Symbol(s))
end
export FILTER
for s in instances(FILTER)
    @eval export $(Symbol(s))
end

include("DeviceEnumeration.jl")
export enumDevices,
  enumDeviceType,
  enumDeviceIsOpened,
  enumUserName,
  enumDeviceName,
  enumSN,
  enumConfig,
  enumConfigInfo
include("DeviceControl.jl")
export deviceOpen,
  deviceConfigOpen,
  deviceClose,
  deviceCloseAll
include("AnalogIn.jl")
export analogInReset,
  analogInConfigure,
  analogInStatus,
  analogInStatusSamplesLeft,
  analogInStatusSamplesValid,
  analogInStatusIndexWrite,
  analogInStatusAutoTriggered,
  analogInStatusData!,
  analogInStatusNoise!,
  analogInStatusSample,
  analogInStatusRecord,
  analogInRecordLengthSet,
  analogInRecordLengthGet,
  analogInFrequencyInfo,
  analogInFrequencySet,
  analogInFrequencyGet,
  analogInBitsInfo,
  analogInBufferSizeInfo,
  analogInBufferSizeSet,
  analogInBufferSizeGet,
  analogInNoiseSizeInfo,
  analogInNoiseSizeSet,
  analogInNoiseSizeGet,
  analogInAcquisitionModeInfo,
  analogInAcquisitionModeSet,
  analogInAcquisitionModeGet,
  analogInChannelCount,
  analogInChannelEnableSet,
  analogInChannelEnableGet,
  analogInChannelFilterInfo,
  analogInChannelFilterSet,
  analogInChannelFilterGet,
  analogInChannelRangeInfo,
  analogInChannelRangeSteps,
  analogInChannelRangeSet,
  analogInChannelRangeGet,
  analogInChannelOffsetInfo,
  analogInChannelOffsetSet,
  analogInChannelOffsetGet,
  analogInChannelAttenuationSet,
  analogInChannelAttenuationGet

end # module
