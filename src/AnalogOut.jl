# Analog Out API

#------------------------------------ Configuration
function analogOutCount(hdwf::Hdwf)
  pcChannel = Ref{Cint}()
  succ = ccall((:FDwfAnalogOutCount,libdwf),Cint,(Hdwf,Ptr{Cint}),
    hdwf,pcChannel)
  succ == 0 && error("Error calling FDwfAnalogOutCount.")
  return pcChannel[]
end

function analogOutMasterSet(hdwf::Hdwf,idxChannel::Int32,idxMaster::Int32)
  succ = ccall((:FDwfAnalogOutMasterSet,libdwf),Cint,(Hdwf,Cint,Cint),
    hdwf,idxChannel,idxMaster)
  succ == 0 && error("Error calling FDwfAnalogOutMasterSet.")
  return nothing
end

function analogOutMasterGet(hdwf::Hdwf,idxChannel::Int32)
  pidxMaster = Ref{Cint}()
  succ = ccall((:FDwfAnalogOutMasterGet,libdwf),Cint,(Hdwf,Cint,Ptr{Cint}),
    hdwf,idxChannel,pidxMaster)
  succ == 0 && error("Error calling FDwfAnalogOutMasterGet.")
  return pidxMaster[]
end

function analogOutTriggerSourceInfo(hdwf::Hdwf,idxChannel::Int32)
  pfstrigsrc = Ref{Cint}()
  succ = ccall((:FDwfAnalogOutTriggerSourceInfo,libdwf),Cint,(Hdwf,Cint,Ptr{Cint}),
    hdwf,idxChannel,pfstrigsrc)
  succ == 0 && error("Error calling FDwfAnalogOutTriggerSourceInfo.")
  return pfstrigsrc[]
end

function analogOutTriggerSourceSet(hdwf::Hdwf,idxChannel::Int32,trigsrc::TRIGSRC)
  succ = ccall((:FDwfAnalogOutTriggerSourceSet,libdwf),Cint,(Hdwf,Cint,Cint),
    hdwf,idxChannel,Cint(trigsrc))
  succ == 0 && error("Error calling FDwfAnalogOutTriggerSourceSet.")
  return nothing
end

function analogOutTriggerSourceGet(hdwf::Hdwf,idxChannel::Int32)
  ptrigsrc = Ref{Cuchar}()
  succ = ccall((:FDwfAnalogOutTriggerSourceGet,libdwf),Cint,(Hdwf,Cint,Ptr{Cuchar}),
    hdwf,idxChannel,ptrigsrc)
  succ == 0 && error("Error calling FDwfAnalogOutTriggerSourceGet.")
  return TRIGSRC(ptrigsrc[])
end

function analogOutRunInfo(hdwf::Hdwf,idxChannel::Int32)
  psecMin = Ref{Cdouble}(); psecMax = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogOutRunInfo,libdwf),Cint,(Hdwf,Cint,Ptr{Cdouble},Ptr{Cdouble}),
    hdwf,idxChannel,psecMin,psecMax)
  succ == 0 && error("Error calling FDwfAnalogOutRunInfo.")
  return (psecMin[],psecMax[])
end

function analogOutRunSet(hdwf::Hdwf,idxChannel::Int32,secRun::Float64)
  succ = ccall((:FDwfAnalogOutRunSet,libdwf),Cint,(Hdwf,Cint,Cdouble),
    hdwf,idxChannel,secRun)
  succ == 0 && error("Error calling FDwfAnalogOutRunSet.")
  return nothing
end

function analogOutRunGet(hdwf::Hdwf,idxChannel::Int32)
  psecRun = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogOutRunGet,libdwf),Cint,(Hdwf,Cint,Ptr{Cdouble}),
    hdwf,idxChannel,psecRun)
  succ == 0 && error("Error calling FDwfAnalogOutRunGet.")
  return psecRun[]
end

function analogOutRunStatus(hdwf::Hdwf,idxChannel::Int32)
  psecRun = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogOutRunStatus,libdwf),Cint,(Hdwf,Cint,Ptr{Cdouble}),
    hdwf,idxChannel,psecRun)
  succ == 0 && error("Error calling FDwfAnalogOutRunStatus.")
  return psecRun[]
end

function analogOutWaitInfo(hdwf::Hdwf,idxChannel::Int32)
  psecMin = Ref{Cdouble}(); psecMax = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogOutWaitInfo,libdwf),Cint,(Hdwf,Cint,Ptr{Cdouble},Ptr{Cdouble}),
    hdwf,idxChannel,psecMin,psecMax)
  succ == 0 && error("Error calling FDwfAnalogOutWaitInfo.")
  return (psecMin[],psecMax[])
end

function analogOutWaitSet(hdwf::Hdwf,idxChannel::Int32,secWait::Float64)
  succ = ccall((:FDwfAnalogOutWaitSet,libdwf),Cint,(Hdwf,Cint,Cdouble),
    hdwf,idxChannel,secWait)
  succ == 0 && error("Error calling FDwfAnalogOutWaitSet.")
  return nothing
end

function analogOutWaitGet(hdwf::Hdwf,idxChannel::Int32)
  psecWait = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogOutWaitGet,libdwf),Cint,(Hdwf,Cint,Ptr{Cdouble}),
    hdwf,idxChannel,psecWait)
  succ == 0 && error("Error calling FDwfAnalogOutWaitGet.")
  return psecWait[]
end

function analogOutRepeatInfo(hdwf::Hdwf,idxChannel::Int32)
  pnMin = Ref{Cint}(); pnMax = Ref{Cint}()
  succ = ccall((:FDwfAnalogOutRepeatInfo,libdwf),Cint,(Hdwf,Cint,Ptr{Cint},Ptr{Cint}),
    hdwf,idxChannel,pnMin,pnMax)
  succ == 0 && error("Error calling FDwfAnalogOutRepeatInfo.")
  return (pnMin[],pnMax[])
end

function analogOutRepeatSet(hdwf::Hdwf,idxChannel::Int32,cRepeat::Int32)
  succ = ccall((:FDwfAnalogOutRepeatSet,libdwf),Cint,(Hdwf,Cint,Cint),
    hdwf,idxChannel,cRepeat)
  succ == 0 && error("Error calling FDwfAnalogOutRepeatSet.")
  return nothing
end

function analogOutRepeatGet(hdwf::Hdwf,idxChannel::Int32)
  pcRepeat = Ref{Cint}()
  succ = ccall((:FDwfAnalogOutRepeatGet,libdwf),Cint,(Hdwf,Cint,Ptr{Cint}),
    hdwf,idxChannel,pcRepeat)
  succ == 0 && error("Error calling FDwfAnalogOutRepeatGet.")
  return pcRepeat[]
end

function analogOutRepeatStatus(hdwf::Hdwf,idxChannel::Int32)
  pcRepeat = Ref{Cint}()
  succ = ccall((:FDwfAnalogOutRepeatStatus,libdwf),Cint,(Hdwf,Cint,Ptr{Cint}),
    hdwf,idxChannel,pcRepeat)
  succ == 0 && error("Error calling FDwfAnalogOutRepeatStatus.")
  return pcRepeat[]
end

function analogOutRepeatTriggerSet(hdwf::Hdwf,idxChannel::Int32,fRepeatTrigger::Bool)
  succ = ccall((:FDwfAnalogOutRepeatTriggerSet,libdwf),Cint,(Hdwf,Cint,Cint),
    hdwf,idxChannel,Cint(fRepeatTrigger))
  succ == 0 && error("Error calling FDwfAnalogOutRepeatTriggerSet.")
  return nothing
end

function analogOutRepeatTriggerGet(hdwf::Hdwf,idxChannel::Int32)
  pfRepeatTrigger = Ref{Cint}()
  succ = ccall((:FDwfAnalogOutRepeatTriggerGet,libdwf),Cint,(Hdwf,Cint,Ptr{Cint}),
    hdwf,idxChannel,pfRepeatTrigger)
  succ == 0 && error("Error calling FDwfAnalogOutRepeatTriggerGet.")
  return Bool(pfRepeatTrigger[])
end

function analogOutModeSet(hdwf::Hdwf,idxChannel::Int32,mode::DWFANALOGOUTMODE)
  succ = ccall((:FDwfAnalogOutModeSet,libdwf),Cint,(Hdwf,Cint,Cint),
    hdwf,idxChannel,Cint(mode))
  succ == 0 && error("Error calling FDwfAnalogOutModeSet.")
  return nothing
end

function analogOutModeGet(hdwf::Hdwf,idxChannel::Int32)
  pmode = Ref{Cint}()
  succ = ccall((:FDwfAnalogOutModeGet,libdwf),Cint,(Hdwf,Cint,Ptr{Cint}),
    hdwf,idxChannel,pmode)
  succ == 0 && error("Error calling FDwfAnalogOutModeGet.")
  return DWFANALOGOUTMODE(pmode[])
end

function analogOutIdleInfo(hdwf::Hdwf,idxChannel::Int32)
  pfsidle = Ref{Cint}()
  succ = ccall((:FDwfAnalogOutIdleInfo,libdwf),Cint,(Hdwf,Cint,Ptr{Cint}),
    hdwf,idxChannel,pfsidle)
  succ == 0 && error("Error calling FDwfAnalogOutIdleInfo.")
  return pfsidle[]
end

function analogOutIdleSet(hdwf::Hdwf,idxChannel::Int32,idle::DWFANALOGOUTIDLE)
  succ = ccall((:FDwfAnalogOutIdleSet,libdwf),Cint,(Hdwf,Cint,Cint),
    hdwf,idxChannel,Cint(idle))
  succ == 0 && error("Error calling FDwfAnalogOutIdleSet.")
  return nothing
end

function analogOutIdleGet(hdwf::Hdwf,idxChannel::Int32)
  pidle = Ref{Cint}()
  succ = ccall((:FDwfAnalogOutIdleGet,libdwf),Cint,(Hdwf,Cint,Ptr{Cint}),
    hdwf,idxChannel,pidle)
  succ == 0 && error("Error calling FDwfAnalogOutIdleGet.")
  return DWFANALOGOUTIDLE(pidle[])
end

function analogOutNodeInfo(hdwf::Hdwf,idxChannel::Int32)
  pfsnode = Ref{Cint}()
  succ = ccall((:FDwfAnalogOutNodeInfo,libdwf),Cint,(Hdwf,Cint,Ptr{Cint}),
    hdwf,idxChannel,pfsnode)
  succ == 0 && error("Error calling FDwfAnalogOutNodeInfo.")
  return pfsnode[]
end

function analogOutNodeEnableSet(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE,fEnable::Bool)
  succ = ccall((:FDwfAnalogOutNodeEnableSet,libdwf),Cint,(Hdwf,Cint,Cint,Cint),
    hdwf,idxChannel,Cint(node),Cint(fEnable))
  succ == 0 && error("Error calling FDwfAnalogOutNodeEnableSet.")
  return nothing
end

function analogOutNodeEnableGet(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE)
  pfEnable = Ref{Cint}()
  succ = ccall((:FDwfAnalogOutNodeEnableGet,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cint}),
    hdwf,idxChannel,Cint(node),pfEnable)
  succ == 0 && error("Error calling FDwfAnalogOutNodeEnableGet.")
  return Bool(pfEnable[])
end

function analogOutNodeFunctionInfo(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE)
  pfsfunc = Ref{Cint}()
  succ = ccall((:FDwfAnalogOutNodeFunctionInfo,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cint}),
    hdwf,idxChannel,Cint(node),pfsfunc)
  succ == 0 && error("Error calling FDwfAnalogOutNodeFunctionInfo.")
  return pfsfunc[]
end

function analogOutNodeFunctionSet(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE,func::FUNC)
  succ = ccall((:FDwfAnalogOutNodeFunctionSet,libdwf),Cint,(Hdwf,Cint,Cint,Cuchar),
    hdwf,idxChannel,Cint(node),Cuchar(func))
  succ == 0 && error("Error calling FDwfAnalogOutNodeFunctionSet.")
  return nothing
end

function analogOutNodeFunctionGet(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE)
  pfunc = Ref{Cuchar}()
  succ = ccall((:FDwfAnalogOutNodeFunctionGet,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cuchar}),
    hdwf,idxChannel,Cint(node),pfunc)
  succ == 0 && error("Error calling FDwfAnalogOutNodeFunctionGet.")
  return FUNC(pfunc[])
end

function analogOutNodeFrequencyInfo(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE)
  phzMin = Ref{Cdouble}(); phzMax = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogOutNodeFrequencyInfo,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble}),
    hdwf,idxChannel,node,phzMin,phzMax)
  succ == 0 && error("Error calling FDwfAnalogOutNodeFrequencyInfo.")
  return (phzMin[],phzMax[])
end

function analogOutNodeFrequencySet(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE,hzFrequency::Float64)
  succ = ccall((:FDwfAnalogOutNodeFrequencySet,libdwf),Cint,(Hdwf,Cint,Cint,Cdouble),
    hdwf,idxChannel,node,hzFrequency)
  succ == 0 && error("Error calling FDwfAnalogOutNodeFrequencySet.")
  return nothing
end

function analogOutNodeFrequencyGet(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE)
  phzFrequency = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogOutNodeFrequencyGet,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cdouble}),
    hdwf,idxChannel,node,phzFrequency)
  succ == 0 && error("Error calling FDwfAnalogOutNodeFrequencyGet.")
  return phzFrequency[]
end

function analogOutNodeAmplitudeInfo(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE)
  pMin = Ref{Cdouble}(); pMax = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogOutNodeAmplitudeInfo,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble}),
    hdwf,idxChannel,node,pMin,pMax)
  succ == 0 && error("Error calling FDwfAnalogOutNodeAmplitudeInfo.")
  return (pMin[],pMax[])
end

function analogOutNodeAmplitudeSet(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE,vAmplitude::Float64)
  succ = ccall((:FDwfAnalogOutNodeAmplitudeSet,libdwf),Cint,(Hdwf,Cint,Cint,Cdouble),
    hdwf,idxChannel,node,vAmplitude)
  succ == 0 && error("Error calling FDwfAnalogOutNodeAmplitudeSet.")
  return nothing
end

function analogOutNodeAmplitudeGet(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE)
  pvAmplitude = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogOutNodeAmplitudeGet,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cdouble}),
    hdwf,idxChannel,node,pvAmplitude)
  succ == 0 && error("Error calling FDwfAnalogOutNodeAmplitudeGet.")
  return pvAmplitude[]
end

function analogOutNodeOffsetInfo(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE)
  pMin = Ref{Cdouble}(); pMax = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogOutNodeOffsetInfo,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble}),
    hdwf,idxChannel,node,pMin,pMax)
  succ == 0 && error("Error calling FDwfAnalogOutNodeOffsetInfo.")
  return (pMin[],pMax[])
end

function analogOutNodeOffsetSet(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE,vOffset::Float64)
  succ = ccall((:FDwfAnalogOutNodeOffsetSet,libdwf),Cint,(Hdwf,Cint,Cint,Cdouble),
    hdwf,idxChannel,node,vOffset)
  succ == 0 && error("Error calling FDwfAnalogOutNodeOffsetSet.")
  return nothing
end

function analogOutNodeOffsetGet(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE)
  pvOffset = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogOutNodeOffsetGet,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cdouble}),
    hdwf,idxChannel,node,pvOffset)
  succ == 0 && error("Error calling FDwfAnalogOutNodeOffsetGet.")
  return pvOffset[]
end

function analogOutNodeSymmetryInfo(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE)
  ppercentageMin = Ref{Cdouble}(); ppercentageMax = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogOutNodeSymmetryInfo,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble}),
    hdwf,idxChannel,node,ppercentageMin,ppercentageMax)
  succ == 0 && error("Error calling FDwfAnalogOutNodeSymmetryInfo.")
  return (ppercentageMin[],ppercentageMax[])
end

function analogOutNodeSymmetrySet(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE,percentageSymmetry::Float64)
  succ = ccall((:FDwfAnalogOutNodeSymmetrySet,libdwf),Cint,(Hdwf,Cint,Cint,Cdouble),
    hdwf,idxChannel,node,percentageSymmetry)
  succ == 0 && error("Error calling FDwfAnalogOutNodeSymmetrySet.")
  return nothing
end

function analogOutNodeSymmetryGet(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE)
  ppercentageSymmetry = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogOutNodeSymmetryGet,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cdouble}),
    hdwf,idxChannel,node,ppercentageSymmetry)
  succ == 0 && error("Error calling FDwfAnalogOutNodeSymmetryGet.")
  return ppercentageSymmetry[]
end

function analogOutNodePhaseInfo(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE)
  pdegreeMin = Ref{Cdouble}(); pdegreeMax = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogOutNodePhaseInfo,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble}),
    hdwf,idxChannel,node,pdegreeMin,pdegreeMax)
  succ == 0 && error("Error calling FDwfAnalogOutNodePhaseInfo.")
  return (pdegreeMin[],pdegreeMax[])
end

function analogOutNodePhaseSet(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE,degreePhase::Float64)
  succ = ccall((:FDwfAnalogOutNodePhaseSet,libdwf),Cint,(Hdwf,Cint,Cint,Cdouble),
    hdwf,idxChannel,node,degreePhase)
  succ == 0 && error("Error calling FDwfAnalogOutNodePhaseSet.")
  return nothing
end

function analogOutNodePhaseGet(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE)
  pdegreePhase = Ref{Cdouble}()
  succ = ccall((:FDwfAnalogOutNodePhaseGet,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cdouble}),
    hdwf,idxChannel,node,pdegreePhase)
  succ == 0 && error("Error calling FDwfAnalogOutNodePhaseGet.")
  return pdegreePhase[]
end

function analogOutNodeDataInfo(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE)
  pnSamplesMin = Ref{Cint}(); pnSamplesMax = Ref{Cint}()
  succ = ccall((:FDwfAnalogOutNodeDataInfo,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cint},Ptr{Cint}),
    hdwf,idxChannel,node,pnSamplesMin,pnSamplesMax)
  succ == 0 && error("Error calling FDwfAnalogOutNodeDataInfo.")
  return (pnSamplesMin[],pnSamplesMax[])
end

function analogOutNodeDataSet(
    hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE,rgdVoltData::Vector{Float64},len::Int32)
  succ = ccall((:FDwfAnalogOutNodeDataSet,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cdouble},Cint),
    hdwf,idxChannel,node, rgdVoltData,len)
  succ == 0 && error("Error calling FDwfAnalogOutNodeDataSet.")
  return rgdVoltData
end

function analogOutNodeDataSet(
    hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE,rgdVoltData::Vector{Float64})
  succ = ccall((:FDwfAnalogOutNodeDataSet,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cdouble},Cint),
    hdwf,idxChannel,node,rgdVoltData,Cint(length(rgdVoltData)))
  succ == 0 && error("Error calling FDwfAnalogOutNodeDataSet.")
  return rgdVoltData
end

#------------------------------------ Control
function analogOutReset(hdwf::Hdwf,idxChannel::Int32)
  succ = ccall((:FDwfAnalogOutReset,libdwf),Cint,(Hdwf,Cint),
    hdwf,idxChannel)
  succ == 0 && error("Error calling FDwfAnalogOutReset.")
  return nothing
end

function analogOutConfigure(hdwf::Hdwf,idxChannel::Int32,fStart::Bool)
  succ = ccall((:FDwfAnalogOutConfigure,libdwf),Cint,(Hdwf,Cint,Cint),
    hdwf,idxChannel,Cint(fStart))
  succ == 0 && error("Error calling FDwfAnalogOutConfigure.")
  return nothing
end

function analogOutStatus(hdwf::Hdwf,idxChannel::Int32)
  psts = Ref{Cuchar}()
  succ = ccall((:FDwfAnalogOutStatus,libdwf),Cint,(Hdwf,Cint,Ptr{Cuchar}),
    hdwf,idxChannel,psts)
  succ == 0 && error("Error calling FDwfAnalogOutStatus.")
  return DWFSTATE(psts[])
end

function analogOutNodePlayStatus(hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE)
  cdDataFree = Ref{Cint}(); cdDataLost = Ref{Cint}(); cdDataCorrupted = Ref{Cint}()
  succ = ccall((:FDwfAnalogOutNodePlayStatus,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cint},Ptr{Cint},Ptr{Cint}),
    hdwf,idxChannel,node,cdDataFree,cdDataLost,cdDataCorrupted)
  succ == 0 && error("Error calling FDwfAnalogOutNodePlayStatus.")
  return (cdDataFree[],cdDataLost[],cdDataCorrupted[])
end

function analogOutNodePlayData(
    hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE,rgdVoltData::Vector{Float64},len::Int32)
  succ = ccall((:FDwfAnalogOutNodePlayData,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cdouble},Cint),
    hdwf,idxChannel,node,rgdVoltData,len)
  succ == 0 && error("Error calling FDwfAnalogOutNodePlayData.")
  return rgdVoltData
end

function analogOutNodePlayData(
    hdwf::Hdwf,idxChannel::Int32,node::ANALOGOUTNODE,rgdVoltData::Vector{Float64})
  succ = ccall((:FDwfAnalogOutNodePlayData,libdwf),Cint,(Hdwf,Cint,Cint,Ptr{Cdouble},Cint),
    hdwf,idxChannel,node, rgdVoltData,Cint(length(rgdVoltData)))
  succ == 0 && error("Error calling FDwfAnalogOutNodePlayData.")
  return rgdVoltData
end

#### TODO ####
# // EExplorer channel 3&4 current/voltage limitation
# DWFAPI BOOL FDwfAnalogOutLimitationInfo(HDWF hdwf, int idxChannel, double *pMin, double *pMax);
# DWFAPI BOOL FDwfAnalogOutLimitationSet(HDWF hdwf, int idxChannel, double limit);
# DWFAPI BOOL FDwfAnalogOutLimitationGet(HDWF hdwf, int idxChannel, double *plimit);
# // needed for EExplorer, don't care for ADiscovery
# DWFAPI BOOL FDwfAnalogOutCustomAMFMEnableSet(HDWF hdwf, int idxChannel, BOOL fEnable);
# DWFAPI BOOL FDwfAnalogOutCustomAMFMEnableGet(HDWF hdwf, int idxChannel, BOOL *pfEnable);
