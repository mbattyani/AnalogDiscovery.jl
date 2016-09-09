using AnalogDiscovery

function go(fs::Float64)
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

  analogInFrequencySet(hdwf,fs)
  bmin,bmax = analogInBufferSizeInfo(hdwf)
  bsize = min(Int32(round(fs)),bmax)
  analogInBufferSizeSet(hdwf,bsize)
  analogInAcquisitionModeSet(hdwf,ACQMODESINGLE)

  chVoltMin,chVoltMax,chSteps = analogInChannelRangeInfo(hdwf)
  chCount = analogInChannelCount(hdwf)
  for ch in Int32(0):Int32(chCount-1)
    analogInChannelEnableSet(hdwf,ch,true)
    analogInChannelFilterSet(hdwf,ch,FILTERAVERAGE)
    analogInChannelRangeSet(hdwf,ch,chVoltMax)
  end

  # Collect 10-sec worth of data from all channels
  blks = Int(ceil(10*fs/bsize))
  chData = [Vector{Float64}(blks*bsize) for i in 1:chCount]

  for b in 1:blks
    analogInConfigure(hdwf,false,true) # start a single acquistion
    while analogInStatus(hdwf,true) != DWFSTATEDONE
      sleep(0.001)
    end

    chDataBuf = Vector{Float64}(bsize)
    for ch in Int32(0):Int32(chCount-1)
      analogInStatusData!(chDataBuf,hdwf,ch)
      chData[ch+1][(b-1)*bsize+(1:bsize)] = chDataBuf[:]
      #showall(chDataBuf)
    end
  end

  deviceClose(hdwf)
  return chData
end

const fs = 128.0
chData = go(fs)
