# Device Control API

function deviceOpen(idxDevice::Int32)
  pHdwf = Ref{Hdwf}(0)
  succ = ccall((:FDwfDeviceOpen,libdwf),Cint,(Cint,Ptr{Hdwf}),
    idxDevice,pHdwf)
  succ == 0 && error("Error calling FDwfDeviceOpen.")
  return pHdwf[]
end

function deviceConfigOpen(idxDevice::Int32,idxCfg::Int32)
  pHdwf = Ref{Hdwf}(0)
  succ = ccall((:FDwfDeviceConfigOpen,libdwf),Cint,(Cint,Cint,Ptr{Hdwf}),
    idxDevice,idxCfg,pHdwf)
  succ == 0 && error("Error calling FDwfDeviceConfigOpen.")
  return pHdwf[]
end

function deviceClose(hdwf::Hdwf)
  succ = ccall((:FDwfDeviceClose,libdwf),Cint,(Hdwf,),
    hdwf)
  succ == 0 && error("Error calling FDwfDeviceClose.")
  return nothing
end


function deviceCloseAll()
  succ = ccall((:FDwfDeviceCloseAll,libdwf),Cint,()
    )
  succ == 0 && error("Error calling FDwfDeviceCloseAll.")
  return nothing
end

#### TODO ####
# DWFAPI BOOL FDwfDeviceAutoConfigureSet(HDWF hdwf, BOOL fAutoConfigure);
# DWFAPI BOOL FDwfDeviceAutoConfigureGet(HDWF hdwf, BOOL *pfAutoConfigure);
# DWFAPI BOOL FDwfDeviceReset(HDWF hdwf);
# DWFAPI BOOL FDwfDeviceEnableSet(HDWF hdwf, BOOL fEnable);
# DWFAPI BOOL FDwfDeviceTriggerInfo(HDWF hdwf, int *pfstrigsrc); // use IsBitSet
# DWFAPI BOOL FDwfDeviceTriggerSet(HDWF hdwf, int idxPin, TRIGSRC trigsrc);
# DWFAPI BOOL FDwfDeviceTriggerGet(HDWF hdwf, int idxPin, TRIGSRC *ptrigsrc);
# DWFAPI BOOL FDwfDeviceTriggerPC(HDWF hdwf);
