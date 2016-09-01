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

  analogInFrequencySet(hdwf,128.0)
  bmin,bmax = analogInBufferSizeInfo(hdwf)
  analogInBufferSizeSet(hdwf,bmin)
  analogInAcquisitionModeSet(hdwf,ACQMODESINGLE)

  chVoltMin,chVoltMax,chSteps = analogInChannelRangeInfo(hdwf)
  chCount = analogInChannelCount(hdwf)
  for ch in Int32(0):Int32(chCount-1)
    analogInChannelEnableSet(hdwf,ch,true)
    analogInChannelFilterSet(hdwf,ch,FILTERAVERAGE)
    analogInChannelRangeSet(hdwf,ch,chVoltMin)
  end

  # Collect 10-sec worth of data from all channels
  blks = Int(ceil(1280.0/bmin))
  chData = [Vector{Float64}(blks*bmin) for i in 1:chCount]

  for b in 1:blks
    analogInConfigure(hdwf,false,true) # start a single acquistion
    while analogInStatus(hdwf,true) != DWFSTATEDONE
      sleep(0.001)
    end

    chDataBuf = Vector{Float64}(bmin)
    for ch in Int32(0):Int32(chCount-1)
      analogInStatusData!(chDataBuf,hdwf,ch)
      chData[ch+1][(b-1)*bmin+(1:bmin)] = chDataBuf[:]
      #showall(chDataBuf)
    end
  end

  deviceClose(hdwf)
  return chData
end

go()
