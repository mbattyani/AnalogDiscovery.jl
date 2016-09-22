using AnalogDiscovery

function go()
  cDev = enumDevices()
  @show ("Available",cDev)
  myDev = Int32(0)
  if cDev > 0
    if enumDeviceIsOpened(myDev)
      error("Error opening device, already in use.")
    end
    hdwf = deviceOpen(myDev)
  else
    error("No devices available.")
  end

  ch = Int32(0)
  analogOutNodeEnableSet(hdwf,ch,ANALOGOUTNODECARRIER,true)
  analogOutNodeFunctionSet(hdwf,ch,ANALOGOUTNODECARRIER,FUNCSINE)
  analogOutNodeFrequencySet(hdwf,ch,ANALOGOUTNODECARRIER,10.0)
  analogOutNodeAmplitudeSet(hdwf,ch,ANALOGOUTNODECARRIER,1.0)
  analogOutNodeOffsetSet(hdwf,ch,ANALOGOUTNODECARRIER,0.0)

  analogOutNodeEnableSet(hdwf,ch,ANALOGOUTNODEAM,true)
  analogOutNodeFunctionSet(hdwf,ch,ANALOGOUTNODEAM,FUNCSQUARE)
  analogOutNodeFrequencySet(hdwf,ch,ANALOGOUTNODEAM,0.5)
  analogOutNodeAmplitudeSet(hdwf,ch,ANALOGOUTNODEAM,200.0)
  analogOutNodeOffsetSet(hdwf,ch,ANALOGOUTNODEAM,100.0)


  analogOutRunSet(hdwf,ch,1.5)
  analogOutRepeatSet(hdwf,ch,Int32(3))

  analogOutConfigure(hdwf,ch,true)
  sleep(10.0)
  analogOutConfigure(hdwf,ch,true)
  sleep(10.0)
  deviceClose(hdwf)
end

go()
