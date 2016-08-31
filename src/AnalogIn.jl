# Analog In API

#------------------------------------ Control and status
function analogInReset(hdwf::Hdwf)
  succ = ccall((:FDwfAnalogInReset,libdwf),Cint,(Hdwf,),
    hdwf)
  succ == 0 && error("Error calling FDwfAnalogInReset.")
  return nothing
end

function analogInConfigure(hdwf::Hdwf,fReconfigure::Bool,fStart::Bool)
  succ = ccall((:FDwfAnalogInConfigure,libdwf),Cint,(Hdwf,Cint,Cint),
    hdwf,Cint(fReconfigure),Cint(fStart))
  succ == 0 && error("Error calling FDwfAnalogInConfigure.")
  return nothing
end

function analogInStatus(hdwf::Hdwf,fReadData::Bool)
  psts = Ref{Cuchar}()
  succ = ccall((:FDwfAnalogInStatus,libdwf),Cint,(Hdwf,Cint,Ptr{Cuchar}),
    hdwf,Cint(fReadData),psts)
  succ == 0 && error("Error calling FDwfAnalogInStatus.")
  return DWFSTATE(psts[])
end

function analogInStatusSamplesLeft(hdwf::Hdwf)
  pcSamplesLeft = Ref{Cint}()
  succ = ccall((:FDwfAnalogInStatusSamplesLeft,libdwf),Cint,(Hdwf,Ptr{Cint}),
    hdwf,pcSamplesLeft)
  succ == 0 && error("Error calling FDwfAnalogInStatusSamplesLeft.")
  return pcSamplesLeft[]
end

function analogInStatusSamplesValid(hdwf::Hdwf)
  pcSamplesValid = Ref{Cint}()
  succ = ccall((:FDwfAnalogInStatusSamplesValid,libdwf),Cint,(Hdwf,Ptr{Cint}),
    hdwf,pcSamplesValid)
  succ == 0 && error("Error calling FDwfAnalogInStatusSamplesValid.")
  return pcSamplesValid[]
end

function analogInStatusIndexWrite(hdwf::Hdwf)
  pidxWrite = Ref{Cint}()
  succ = ccall((:FDwfAnalogInStatusIndexWrite,libdwf),Cint,(Hdwf,Ptr{Cint}),
    hdwf,pidxWrite)
  succ == 0 && error("Error calling FDwfAnalogInStatusIndexWrite.")
  return pidxWrite[]
end

function analogInStatusAutoTriggered(hdwf::Hdwf)
  pfAuto = Ref{Cint}()
  succ = ccall((:FDwfAnalogInStatusAutoTriggered,libdwf),Cint,(Hdwf,Ptr{Cint}),
    hdwf,pfAuto)
  succ == 0 && error("Error calling FDwfAnalogInStatusAutoTriggered.")
  return Bool(pfAuto[])
end

function analogInStatusData!(rgdVoltData::Vector{Float64},
    hdwf::Hdwf,idxChannel::Int32)
  succ = ccall((:FDwfAnalogInStatusData,libdwf),Cint,(Hdwf,Cint,Ptr{Cdouble},Cint),
    hdwf,idxChannel,rgdVoltData,Cint(length(rgdVoltData)))
  succ == 0 && error("Error calling FDwfAnalogInStatusData.")
  return rgdVoltData
end

function analogInStatusNoise!(rgdMin::Vector{Float64},rgdMax::Vector{Float64},
    hdwf::Hdwf,idxChannel::Int32)
  succ = ccall((:FDwfAnalogInStatusNoise,libdwf),Cint,(Hdwf,Cint,Ptr{Cdouble},Ptr{Cdouble},Cint),
    hdwf,idxChannel,rgdMin,rgdMax,Cint(length(rgdMin)))
  succ == 0 && error("Error calling FDwfAnalogInStatusNoise.")
  return (rgdMin,rgdMax)
end

function analogInStatusSample(hdwf::Hdwf,idxChannel::Int32)
  pdVoltSample = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogInStatusSample,libdwf),Cint,(Hdwf,Cint,Ptr{Cdouble}),
    hdwf,idxChannel,pdVoltSample)
  succ == 0 && error("Error calling FDwfAnalogInStatusSample.")
  return pdVoltSample[]
end

function analogInStatusRecord(hdwf::Hdwf)
  pcdDataAvailable = Ref{Cint}(); pcdDataLost = Ref{Cint}(); pcdDataCorrupt = Ref{Cint}()
  succ = ccall((:FDwfAnalogInStatusRecord,libdwf),Cint,(Hdwf,Ptr{Cint},Ptr{Cint},Ptr{Cint}),
    hdwf,pcdDataAvailable,pcdDataLost,pcdDataCorrupt)
  succ == 0 && error("Error calling FDwfAnalogInStatusRecord.")
  return (pcdDataAvailable[],pcdDataLost[],pcdDataCorrupt[])
end

function analogInRecordLengthSet(hdwf::Hdwf,sLegth::Float64)
  succ = ccall((:FDwfAnalogInRecordLengthSet,libdwf),Cint,(Hdwf,Cdouble),
    hdwf,sLegth)
  succ == 0 && error("Error calling FDwfAnalogInRecordLengthSet.")
  return nothing
end

function analogInRecordLengthGet(hdwf::Hdwf)
  psLegth = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogInRecordLengthGet,libdwf),Cint,(Hdwf,Ptr{Cdouble}),
    hdwf,psLegth)
  succ == 0 && error("Error calling FDwfAnalogInRecordLengthGet.")
  return psLegth[]
end

#------------------------------------ Acquisition configuration
function analogInFrequencyInfo(hdwf::Hdwf)
  phzMin = Ref{Cdouble}(); phzMax = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogInFrequencyInfo,libdwf),Cint,(Hdwf,Ptr{Cdouble},Ptr{Cdouble}),
    hdwf,phzMin,phzMax)
  succ == 0 && error("Error calling FDwfAnalogInFrequencyInfo.")
  return (phzMin[],phzMax[])
end

function analogInFrequencySet(hdwf::Hdwf,hzFrequency::Float64)
  succ = ccall((:FDwfAnalogInFrequencySet,libdwf),Cint,(Hdwf,Cdouble),
    hdwf,hzFrequency)
  succ == 0 && error("Error calling FDwfAnalogInFrequencySet.")
  return nothing
end

function analogInFrequencyGet(hdwf::Hdwf)
  phzFrequency = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogInFrequencyGet,libdwf),Cint,(Hdwf,Ptr{Cdouble}),
    hdwf,phzFrequency)
  succ == 0 && error("Error calling FDwfAnalogInFrequencyGet.")
  return phzFrequency[]
end

function analogInBitsInfo(hdwf::Hdwf)
  pnBits = Ref{Cint}()
  succ = ccall((:FDwfAnalogInBitsInfo,libdwf),Cint,(Hdwf,Ptr{Cint}),
    hdwf,pnBits)
  succ == 0 && error("Error calling FDwfAnalogInBitsInfo.")
  return pnBits[]
end

function analogInBufferSizeInfo(hdwf::Hdwf)
  pnSizeMin = Ref{Cint}(); pnSizeMax = Ref{Cint}()
  succ = ccall((:FDwfAnalogInBufferSizeInfo,libdwf),Cint,(Hdwf,Ptr{Cint},Ptr{Cint}),
    hdwf,pnSizeMin,pnSizeMax)
  succ == 0 && error("Error calling FDwfAnalogInBufferSizeInfo.")
  return (pnSizeMin[],pnSizeMax[])
end

function analogInBufferSizeSet(hdwf::Hdwf,nSize::Int32)
  succ = ccall((:FDwfAnalogInBufferSizeSet,libdwf),Cint,(Hdwf,Cint),
    hdwf,nSize)
  succ == 0 && error("Error calling FDwfAnalogInBufferSizeSet.")
  return nothing
end

function analogInBufferSizeGet(hdwf::Hdwf)
  pnSize = Ref{Cint}()
  succ = ccall((:FDwfAnalogInBufferSizeGet,libdwf),Cint,(Hdwf,Ptr{Cint}),
    hdwf,pnSize)
  succ == 0 && error("Error calling FDwfAnalogInBufferSizeGet.")
  return pnSize[]
end

function analogInNoiseSizeInfo(hdwf::Hdwf)
  pnSizeMax = Ref{Cint}()
  succ = ccall((:FDwfAnalogInNoiseSizeInfo,libdwf),Cint,(Hdwf,Ptr{Cint}),
    hdwf,pnSizeMax)
  succ == 0 && error("Error calling FDwfAnalogInNoiseSizeInfo.")
  return pnSizeMax[]
end

function analogInNoiseSizeSet(hdwf::Hdwf,nSize::Int32)
  succ = ccall((:FDwfAnalogInNoiseSizeSet,libdwf),Cint,(Hdwf,Cint),
    hdwf,nSize)
  succ == 0 && error("Error calling FDwfAnalogInNoiseSizeSet.")
  return nothing
end

function analogInNoiseSizeGet(hdwf::Hdwf)
  pnSize = Ref{Cint}()
  succ = ccall((:FDwfAnalogInNoiseSizeGet,libdwf),Cint,(Hdwf,Ptr{Cint}),
    hdwf,pnSize)
  succ == 0 && error("Error calling FDwfAnalogInNoiseSizeGet.")
  return pnSize[]
end

function analogInAcquisitionModeInfo(hdwf::Hdwf)
  pfsacqmode = Ref{Cint}()
  succ = ccall((:FDwfAnalogInAcquisitionModeInfo,libdwf),Cint,(Hdwf,Ptr{Cint}),
    hdwf,pfsacqmode)
  succ == 0 && error("Error calling FDwfAnalogInAcquisitionModeInfo.")
  return pfsacqmode[]
end

function analogInAcquisitionModeSet(hdwf::Hdwf,acqmode::ACQMODE)
  succ = ccall((:FDwfAnalogInAcquisitionModeSet,libdwf),Cint,(Hdwf,Cint),
    hdwf,Cint(acqmode))
  succ == 0 && error("Error calling FDwfAnalogInAcquisitionModeSet.")
  return nothing
end

function analogInAcquisitionModeGet(hdwf::Hdwf)
  pacqmode = Ref{Cint}()
  succ = ccall((:FDwfAnalogInAcquisitionModeGet,libdwf),Cint,(Hdwf,Ptr{Cint}),
    hdwf,pacqmode)
  succ == 0 && error("Error calling FDwfAnalogInAcquisitionModeGet.")
  return ACQMODE(pacqmode[])
end

#------------------------------------ Channel configuration
function analogInChannelCount(hdwf::Hdwf)
  pcChannel = Ref{Cint}()
  succ = ccall((:FDwfAnalogInChannelCount,libdwf),Cint,(Hdwf,Ptr{Cint}),
    hdwf,pcChannel)
  succ == 0 && error("Error calling FDwfAnalogInChannelCount.")
  return pcChannel[]
end

function analogInChannelEnableSet(hdwf::Hdwf,idxChannel::Int32,fEnable::Bool)
  succ = ccall((:FDwfAnalogInChannelEnableSet,libdwf),Cint,(Hdwf,Cint,Cint),
    hdwf,idxChannel,Cint(fEnable))
  succ == 0 && error("Error calling FDwfAnalogInChannelEnableSet.")
  return nothing
end

function analogInChannelEnableGet(hdwf::Hdwf,idxChannel::Int32)
  pfEnable = Ref{Cint}()
  succ = ccall((:FDwfAnalogInChannelEnableGet,libdwf),Cint,(Hdwf,Cint,Ptr{Cint}),
    hdwf,idxChannel,pfEnable)
  succ == 0 && error("Error calling FDwfAnalogInChannelEnableGet.")
  return Bool(pfEnable[])
end

function analogInChannelFilterInfo(hdwf::Hdwf)
  pfsfilter = Ref{Cint}()
  succ = ccall((:FDwfAnalogInChannelFilterInfo,libdwf),Cint,(Hdwf,Ptr{Cint}),
    hdwf,pfsfilter)
  succ == 0 && error("Error calling FDwfAnalogInChannelFilterInfo.")
  return pfsfilter[]
end

function analogInChannelFilterSet(hdwf::Hdwf,idxChannel::Int32,filter::FILTER)
  succ = ccall((:FDwfAnalogInChannelFilterSet,libdwf),Cint,(Hdwf,Cint,Cint),
    hdwf,idxChannel,Cint(filter))
  succ == 0 && error("Error calling FDwfAnalogInChannelFilterSet.")
  return nothing
end

function analogInChannelFilterGet(hdwf::Hdwf,idxChannel::Int32)
  pfilter = Ref{Cint}()
  succ = ccall((:FDwfAnalogInChannelFilterGet,libdwf),Cint,(Hdwf,Cint,Ptr{Cint}),
    hdwf,idxChannel,pfilter)
  succ == 0 && error("Error calling FDwfAnalogInChannelFilterGet.")
  return FILTER(pfilter[])
end

function analogInChannelRangeInfo(hdwf::Hdwf)
  pvoltsMin = Ref{Cdouble}(); pvoltsMax = Ref{Cdouble}(); pnSteps = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogInChannelRangeInfo,libdwf),Cint,(Hdwf,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),
    hdwf,pvoltsMin,pvoltsMax,pnSteps)
  succ == 0 && error("Error calling FDwfAnalogInChannelRangeInfo.")
  return (pvoltsMin[],pvoltsMax[],pnSteps[])
end

function analogInChannelRangeSteps(hdwf::Hdwf)
  rgVoltsStep = Vector{Float64}(32)
  pnSteps = Ref{Cint}()
  succ = ccall((:FDwfAnalogInChannelRangeSteps,libdwf),Cint,(Hdwf,Ptr{Cdouble},Ptr{Cint}),
    hdwf,rgVoltsStep,pnSteps)
  succ == 0 && error("Error calling FDwfAnalogInChannelRangeSteps.")
  return (rgVoltsStep,pnSteps[])
end

function analogInChannelRangeSet(hdwf::Hdwf,idxChannel::Int32,voltsRange::Float64)
  succ = ccall((:FDwfAnalogInChannelRangeSet,libdwf),Cint,(Hdwf,Cint,Cdouble),
    hdwf,idxChannel,voltsRange)
  succ == 0 && error("Error calling FDwfAnalogInChannelRangeSet.")
  return nothing
end

function analogInChannelRangeGet(hdwf::Hdwf,idxChannel::Int32)
  pvoltsRange = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogInChannelRangeGet,libdwf),Cint,(Hdwf,Cint,Ptr{Cdouble}),
    hdwf,idxChannel,pvoltsRange)
  succ == 0 && error("Error calling FDwfAnalogInChannelRangeGet.")
  return pvoltsRange[]
end

function analogInChannelOffsetInfo(hdwf::Hdwf)
  pvoltsMin = Ref{Cdouble}(); pvoltsMax = Ref{Cdouble}(); pnSteps = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogInChannelOffsetInfo,libdwf),Cint,(Hdwf,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),
    hdwf,pvoltsMin,pvoltsMax,pnSteps)
  succ == 0 && error("Error calling FDwfAnalogInChannelOffsetInfo.")
  return (pvoltsMin[],pvoltsMax[],pnSteps[])
end

function analogInChannelOffsetSet(hdwf::Hdwf,idxChannel::Int32,voltOffset::Float64)
  succ = ccall((:FDwfAnalogInChannelOffsetSet,libdwf),Cint,(Hdwf,Cint,Cdouble),
    hdwf,idxChannel,voltOffset)
  succ == 0 && error("Error calling FDwfAnalogInChannelOffsetSet.")
  return nothing
end

function analogInChannelOffsetGet(hdwf::Hdwf,idxChannel::Int32)
  pvoltOffset = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogInChannelOffsetGet,libdwf),Cint,(Hdwf,Cint,Ptr{Cdouble}),
    hdwf,idxChannel,pvoltOffset)
  succ == 0 && error("Error calling FDwfAnalogInChannelOffsetGet.")
  return pvoltOffset[]
end

function analogInChannelAttenuationSet(hdwf::Hdwf,idxChannel::Int32,xAttenuation::Float64)
  succ = ccall((:FDwfAnalogInChannelAttenuationSet,libdwf),Cint,(Hdwf,Cint,Cdouble),
    hdwf,idxChannel,xAttenuation)
  succ == 0 && error("Error calling FDwfAnalogInChannelAttenuationSet.")
  return nothing
end

function analogInChannelAttenuationGet(hdwf::Hdwf,idxChannel::Int32)
  pxAttenuation = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogInChannelAttenuationGet,libdwf),Cint,(Hdwf,Cint,Ptr{Cdouble}),
    hdwf,idxChannel,pxAttenuation)
  succ == 0 && error("Error calling FDwfAnalogInChannelAttenuationGet.")
  return pxAttenuation[]
end

#### TODO ####
# // ANALOG IN INSTRUMENT FUNCTIONS
# // Control and status:
#
# // Acquisition configuration:
#
# // Channel configuration:
#
# // Trigger configuration:
# DWFAPI BOOL FDwfAnalogInTriggerSourceInfo(HDWF hdwf, int *pfstrigsrc); // use IsBitSet
# DWFAPI BOOL FDwfAnalogInTriggerSourceSet(HDWF hdwf, TRIGSRC trigsrc);
# DWFAPI BOOL FDwfAnalogInTriggerSourceGet(HDWF hdwf, TRIGSRC *ptrigsrc);
#
# DWFAPI BOOL FDwfAnalogInTriggerPositionInfo(HDWF hdwf, double *psecMin, double *psecMax, double *pnSteps);
# DWFAPI BOOL FDwfAnalogInTriggerPositionSet(HDWF hdwf, double secPosition);
# DWFAPI BOOL FDwfAnalogInTriggerPositionGet(HDWF hdwf, double *psecPosition);
# DWFAPI BOOL FDwfAnalogInTriggerPositionStatus(HDWF hdwf, double *psecPosition);
#
# DWFAPI BOOL FDwfAnalogInTriggerAutoTimeoutInfo(HDWF hdwf, double *psecMin, double *psecMax, double *pnSteps);
# DWFAPI BOOL FDwfAnalogInTriggerAutoTimeoutSet(HDWF hdwf, double secTimeout);
# DWFAPI BOOL FDwfAnalogInTriggerAutoTimeoutGet(HDWF hdwf, double *psecTimeout);
#
# DWFAPI BOOL FDwfAnalogInTriggerHoldOffInfo(HDWF hdwf, double *psecMin, double *psecMax, double *pnStep);
# DWFAPI BOOL FDwfAnalogInTriggerHoldOffSet(HDWF hdwf, double secHoldOff);
# DWFAPI BOOL FDwfAnalogInTriggerHoldOffGet(HDWF hdwf, double *psecHoldOff);
#
# DWFAPI BOOL FDwfAnalogInTriggerTypeInfo(HDWF hdwf, int *pfstrigtype); // use IsBitSet
# DWFAPI BOOL FDwfAnalogInTriggerTypeSet(HDWF hdwf, TRIGTYPE trigtype);
# DWFAPI BOOL FDwfAnalogInTriggerTypeGet(HDWF hdwf, TRIGTYPE *ptrigtype);
#
# DWFAPI BOOL FDwfAnalogInTriggerChannelInfo(HDWF hdwf, int *pidxMin, int *pidxMax);
# DWFAPI BOOL FDwfAnalogInTriggerChannelSet(HDWF hdwf, int idxChannel);
# DWFAPI BOOL FDwfAnalogInTriggerChannelGet(HDWF hdwf, int *pidxChannel);
#
# DWFAPI BOOL FDwfAnalogInTriggerFilterInfo(HDWF hdwf, int *pfsfilter); // use IsBitSet
# DWFAPI BOOL FDwfAnalogInTriggerFilterSet(HDWF hdwf, FILTER filter);
# DWFAPI BOOL FDwfAnalogInTriggerFilterGet(HDWF hdwf, FILTER *pfilter);
#
# DWFAPI BOOL FDwfAnalogInTriggerLevelInfo(HDWF hdwf, double *pvoltsMin, double *pvoltsMax, double *pnSteps);
# DWFAPI BOOL FDwfAnalogInTriggerLevelSet(HDWF hdwf, double voltsLevel);
# DWFAPI BOOL FDwfAnalogInTriggerLevelGet(HDWF hdwf, double *pvoltsLevel);
#
# DWFAPI BOOL FDwfAnalogInTriggerHysteresisInfo(HDWF hdwf, double *pvoltsMin, double *pvoltsMax, double *pnSteps);
# DWFAPI BOOL FDwfAnalogInTriggerHysteresisSet(HDWF hdwf, double voltsLevel);
# DWFAPI BOOL FDwfAnalogInTriggerHysteresisGet(HDWF hdwf, double *pvoltsHysteresis);
#
# DWFAPI BOOL FDwfAnalogInTriggerConditionInfo(HDWF hdwf, int *pfstrigcond); // use IsBitSet
# DWFAPI BOOL FDwfAnalogInTriggerConditionSet(HDWF hdwf, TRIGCOND trigcond);
# DWFAPI BOOL FDwfAnalogInTriggerConditionGet(HDWF hdwf, TRIGCOND *ptrigcond);
#
# DWFAPI BOOL FDwfAnalogInTriggerLengthInfo(HDWF hdwf, double *psecMin, double *psecMax, double *pnSteps);
# DWFAPI BOOL FDwfAnalogInTriggerLengthSet(HDWF hdwf, double secLength);
# DWFAPI BOOL FDwfAnalogInTriggerLengthGet(HDWF hdwf, double *psecLength);
#
# DWFAPI BOOL FDwfAnalogInTriggerLengthConditionInfo(HDWF hdwf, int *pfstriglen); // use IsBitSet
# DWFAPI BOOL FDwfAnalogInTriggerLengthConditionSet(HDWF hdwf, TRIGLEN triglen);
# DWFAPI BOOL FDwfAnalogInTriggerLengthConditionGet(HDWF hdwf, TRIGLEN *ptriglen);
