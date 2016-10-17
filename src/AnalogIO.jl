# Analog IO API

#------------------------------------ Control


#------------------------------------ Configuration

function analogIOChannelNodeSet(hdwf::Hdwf,idxChannel::Int32,idxNode::Int32,value::Float64)
  succ = ccall((:FDwfAnalogIOChannelNodeSet,libdwf),Cint,(Hdwf,Cint,Cint,Cdouble),
    hdwf,idxChannel,idxNode,value)
  succ == 0 && error("Error calling FDwfAnalogIOChannelNodeSet.")
  return nothing
end

function analogIOEnableSet(hdwf::Hdwf,fMasterEnable::Bool)
  succ = ccall((:FDwfAnalogIOEnableSet,libdwf),Cint,(Hdwf,Cint),
    hdwf,Int32(fMasterEnable))
  succ == 0 && error("Error calling FDwfAnalogIOEnableSet.")
  return nothing
end

#### TODO ####
# // Control:
# DWFAPI BOOL FDwfAnalogIOReset(HDWF hdwf);
# DWFAPI BOOL FDwfAnalogIOConfigure(HDWF hdwf);
# DWFAPI BOOL FDwfAnalogIOStatus(HDWF hdwf);
#
# // Configure:
# DWFAPI BOOL FDwfAnalogIOEnableInfo(HDWF hdwf, BOOL *pfSet, BOOL *pfStatus);
# DWFAPI BOOL FDwfAnalogIOEnableGet(HDWF hdwf, BOOL *pfMasterEnable);
# DWFAPI BOOL FDwfAnalogIOEnableStatus(HDWF hdwf, BOOL *pfMasterEnable);
# DWFAPI BOOL FDwfAnalogIOChannelCount(HDWF hdwf, int *pnChannel);
# DWFAPI BOOL FDwfAnalogIOChannelName(HDWF hdwf, int idxChannel, char szName[32], char szLabel[16]);
# DWFAPI BOOL FDwfAnalogIOChannelInfo(HDWF hdwf, int idxChannel, int *pnNodes);
# DWFAPI BOOL FDwfAnalogIOChannelNodeName(HDWF hdwf, int idxChannel, int idxNode, char szNodeName[32], char szNodeUnits[16]);
# DWFAPI BOOL FDwfAnalogIOChannelNodeInfo(HDWF hdwf, int idxChannel, int idxNode, ANALOGIO *panalogio);
# DWFAPI BOOL FDwfAnalogIOChannelNodeSetInfo(HDWF hdwf, int idxChannel, int idxNode, double *pmin, double *pmax, int *pnSteps);
# DWFAPI BOOL FDwfAnalogIOChannelNodeGet(HDWF hdwf, int idxChannel, int idxNode, double *pvalue);
# DWFAPI BOOL FDwfAnalogIOChannelNodeStatusInfo(HDWF hdwf, int idxChannel, int idxNode, double *pmin, double *pmax, int *pnSteps);
# DWFAPI BOOL FDwfAnalogIOChannelNodeStatus(HDWF hdwf, int idxChannel, int idxNode, double *pvalue);
