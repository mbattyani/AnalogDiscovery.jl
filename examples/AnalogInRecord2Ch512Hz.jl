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
  analogInAcquisitionModeSet(hdwf,ACQMODERECORD)

  chVoltMin,chVoltMax,chSteps = analogInChannelRangeInfo(hdwf)
  chCount = analogInChannelCount(hdwf)
  for ch in Int32(0):Int32(chCount-1)
    analogInChannelEnableSet(hdwf,ch,true)
    analogInChannelFilterSet(hdwf,ch,FILTERAVERAGE)
    analogInChannelRangeSet(hdwf,ch,chVoltMax)
  end

  # sleep(2.0)
  # Collect 20-sec worth of data from all channels
  blks = Int(ceil(20*fs/bsize))
  chData = [Vector{Float64}(blks*bsize) for i in 1:chCount]
  analogInRecordLengthSet(hdwf,0.0)
  analogInConfigure(hdwf,false,true) # start acquistion

  # Similar to AnalogIn_Record.py example in the Waveforms SDK
  cSamples = 0
  nSamples = blks*bsize
  chDataBuf = Vector{Float64}(bsize)
  while cSamples < nSamples
    status = analogInStatus(hdwf,true)
    if (cSamples == 0) && ((status == DWFSTATECONFIG) || (status == DWFSTATEPREFILL) || (status == DWFSTATEARMED))
      # Acquisition not yet started
      continue
    end
    cAvailable,cLost,cCorrupted = analogInStatusRecord(hdwf)
    # @show (cSamples,cAvailable,cLost,cCorrupted)
    cSamples += cLost
    if cAvailable==0
      continue
    end
    if cSamples+cAvailable > nSamples
      cAvailable = nSamples-cSamples
    end
    # get samples
    for ch in Int32(0):Int32(chCount-1)
      analogInStatusData!(chDataBuf,hdwf,ch,Int32(cAvailable))
      chData[ch+1][cSamples+(1:cAvailable)] = chDataBuf[1:cAvailable]
    end
    cSamples += cAvailable
  end

  deviceClose(hdwf)
  return chData
end

const fs = 512.0
chData = go(fs)
