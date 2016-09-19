# Digital IO API

#------------------------------------ Control
function digitalIOReset(hdwf::Hdwf)
  succ = ccall((:FDwfDigitalIOReset,libdwf),Cint,(Hdwf,),
    hdwf)
  succ == 0 && error("Error calling FDwfDigitalIOReset.")
  return nothing
end

function digitalIOConfigure(hdwf::Hdwf)
  succ = ccall((:FDwfDigitalIOConfigure,libdwf),Cint,(Hdwf,),
    hdwf)
  succ == 0 && error("Error calling FDwfDigitalIOConfigure.")
  return nothing
end

function digitalIOStatus(hdwf::Hdwf)
  succ = ccall((:FDwfDigitalIOStatus,libdwf),Cint,(Hdwf,),
    hdwf)
  succ == 0 && error("Error calling FDwfDigitalIOStatus.")
  return nothing
end

#------------------------------------ Configuration
function digitalIOOutputEnableInfo(hdwf::Hdwf)
  pfsOutputEnableMask = Ref{Cuint}()
  succ = ccall((:FDwfDigitalIOOutputEnableInfo,libdwf),Cint,(Hdwf,Ptr{Cuint}),
    hdwf,pfsOutputEnableMask)
  succ == 0 && error("Error calling FDwfDigitalIOOutputEnableInfo.")
  return pfsOutputEnableMask[]
end

function digitalIOOutputEnableSet(hdwf::Hdwf,fsOutputEnable::UInt32)
  succ = ccall((:FDwfDigitalIOOutputEnableSet,libdwf),Cint,(Hdwf,Cuint),
    hdwf,fsOutputEnable)
  succ == 0 && error("Error calling FDwfDigitalIOOutputEnableSet.")
  return nothing
end

function digitalIOOutputEnableGet(hdwf::Hdwf)
  pfsOutputEnable = Ref{Cuint}()
  succ = ccall((:FDwfDigitalIOOutputEnableGet,libdwf),Cint,(Hdwf,Ptr{Cuint}),
    hdwf,pfsOutputEnable)
  succ == 0 && error("Error calling FDwfDigitalIOOutputEnableGet.")
  return pfsOutputEnable[]
end


function digitalIOOutputInfo(hdwf::Hdwf)
  pfsOutputMask = Ref{Cuint}()
  succ = ccall((:FDwfDigitalIOOutputInfo,libdwf),Cint,(Hdwf,Ptr{Cuint}),
    hdwf,pfsOutputMask)
  succ == 0 && error("Error calling FDwfDigitalIOOutputInfo.")
  return pfsOutputMask[]
end

function digitalIOOutputSet(hdwf::Hdwf,fsOutput::UInt32)
  succ = ccall((:FDwfDigitalIOOutputSet,libdwf),Cint,(Hdwf,Cuint),
    hdwf,fsOutput)
  succ == 0 && error("Error calling FDwfDigitalIOOutputSet.")
  return nothing
end

function digitalIOOutputGet(hdwf::Hdwf)
  pfsOutput = Ref{Cuint}()
  succ = ccall((:FDwfDigitalIOOutputGet,libdwf),Cint,(Hdwf,Ptr{Cuint}),
    hdwf,pfsOutput)
  succ == 0 && error("Error calling FDwfDigitalIOOutputGet.")
  return pfsOutput[]
end

function digitalIOInputInfo(hdwf::Hdwf)
  pfsInputMask = Ref{Cuint}()
  succ = ccall((:FDwfDigitalIOInputInfo,libdwf),Cint,(Hdwf,Ptr{Cuint}),
    hdwf,pfsInputMask)
  succ == 0 && error("Error calling FDwfDigitalIOInputInfo.")
  return pfsInputMask[]
end

function digitalIOInputStatus(hdwf::Hdwf)
  pfsInput = Ref{Cuint}()
  succ = ccall((:FDwfDigitalIOInputStatus,libdwf),Cint,(Hdwf,Ptr{Cuint}),
    hdwf,pfsInput)
  succ == 0 && error("Error calling FDwfDigitalIOInputStatus.")
  return pfsInput[]
end
