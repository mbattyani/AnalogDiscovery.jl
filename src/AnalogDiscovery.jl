module AnalogDiscovery

@static if Sys.isunix()
  const libdwf = Libdl.find_library("libdwf.so")
end

@static if Sys.iswindows()
  const libdwf = Libdl.find_library("dwf.dll")
end

@static if Sys.isapple()
  const libdwf = find_library("dwf", ["/Library/Frameworks/dwf.framework"])
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
export TRIGSRC
for s in instances(TRIGSRC)
    @eval export $(Symbol(s))
end
export DWFANALOGOUTMODE
for s in instances(DWFANALOGOUTMODE)
    @eval export $(Symbol(s))
end
export DWFANALOGOUTIDLE
for s in instances(DWFANALOGOUTIDLE)
    @eval export $(Symbol(s))
end
export ANALOGOUTNODE
for s in instances(ANALOGOUTNODE)
    @eval export $(Symbol(s))
end
export FUNC
for s in instances(FUNC)
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
include("AnalogOut.jl")
export analogOutCount,
  analogOutMasterSet,
  analogOutMasterGet,
  analogOutTriggerSourceInfo,
  analogOutTriggerSourceSet,
  analogOutTriggerSourceGet,
  analogOutRunInfo,
  analogOutRunSet,
  analogOutRunGet,
  analogOutRunStatus,
  analogOutWaitInfo,
  analogOutWaitSet,
  analogOutWaitGet,
  analogOutRepeatInfo,
  analogOutRepeatSet,
  analogOutRepeatGet,
  analogOutRepeatStatus,
  analogOutRepeatTriggerSet,
  analogOutRepeatTriggerGet,
  analogOutModeSet,
  analogOutModeGet,
  analogOutIdleInfo,
  analogOutIdleSet,
  analogOutIdleGet,
  analogOutNodeInfo,
  analogOutNodeEnableSet,
  analogOutNodeEnableGet,
  analogOutNodeFunctionInfo,
  analogOutNodeFunctionSet,
  analogOutNodeFunctionGet,
  analogOutNodeFrequencyInfo,
  analogOutNodeFrequencySet,
  analogOutNodeFrequencyGet,
  analogOutNodeAmplitudeInfo,
  analogOutNodeAmplitudeSet,
  analogOutNodeAmplitudeGet,
  analogOutNodeOffsetInfo,
  analogOutNodeOffsetSet,
  analogOutNodeOffsetGet,
  analogOutNodeSymmetryInfo,
  analogOutNodeSymmetrySet,
  analogOutNodeSymmetryGet,
  analogOutNodePhaseInfo,
  analogOutNodePhaseSet,
  analogOutNodePhaseGet,
  analogOutNodeDataInfo,
  analogOutNodeDataSet,
  analogOutNodeDataSet,
  analogOutReset,
  analogOutConfigure,
  analogOutStatus,
  analogOutNodePlayStatus,
  analogOutNodePlayData,
  analogOutNodePlayData
include("DigitalIO.jl")
export digitalIOReset,
  digitalIOConfigure,
  digitalIOStatus,
  digitalIOOutputEnableInfo,
  digitalIOOutputEnableSet,
  digitalIOOutputEnableGet,
  digitalIOOutputInfo,
  digitalIOOutputSet,
  digitalIOOutputGet,
  digitalIOInputInfo,
  digitalIOInputStatus,
  digitalIOInputStatus!

include("AnalogIO.jl")
export analogIOChannelNodeSet,
  analogIOEnableSet

end # module
