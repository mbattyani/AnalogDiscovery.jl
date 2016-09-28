using AnalogDiscovery

function analogOutGatedSineSettings(hdwf::Hdwf,ch::Int32)
  analogOutNodeEnableSet(hdwf,ch,ANALOGOUTNODECARRIER,true)
  analogOutNodeFunctionSet(hdwf,ch,ANALOGOUTNODECARRIER,FUNCSINE)
  analogOutNodeFrequencySet(hdwf,ch,ANALOGOUTNODECARRIER,10.0)
  analogOutNodeAmplitudeSet(hdwf,ch,ANALOGOUTNODECARRIER,0.05)
  analogOutNodeOffsetSet(hdwf,ch,ANALOGOUTNODECARRIER,0.0)

  analogOutNodeEnableSet(hdwf,ch,ANALOGOUTNODEAM,true)
  analogOutNodeFunctionSet(hdwf,ch,ANALOGOUTNODEAM,FUNCSQUARE)
  analogOutNodeFrequencySet(hdwf,ch,ANALOGOUTNODEAM,5.0)
  analogOutNodeAmplitudeSet(hdwf,ch,ANALOGOUTNODEAM,200.0)
  analogOutNodeOffsetSet(hdwf,ch,ANALOGOUTNODEAM,100.0)

  analogOutRunSet(hdwf,ch,0.2)
  analogOutRepeatSet(hdwf,ch,Int32(3))
end

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
  analogOutGatedSineSettings(hdwf,ch)

  for in in 1:10
    @time begin analogOutNodeFrequencySet(hdwf,ch,ANALOGOUTNODECARRIER,4000.0)
    analogOutConfigure(hdwf,ch,true) end
    sleep(3.0)
    @time begin analogOutNodeFrequencySet(hdwf,ch,ANALOGOUTNODECARRIER,7000.0)
    analogOutConfigure(hdwf,ch,true) end
    sleep(3.0)
  end

  deviceClose(hdwf)
end

go()
