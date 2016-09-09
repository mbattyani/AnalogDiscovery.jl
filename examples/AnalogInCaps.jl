using AnalogDiscovery

function caps(devIndex=0)
  cDev = enumDevices()
  @show ("Available",cDev)
  myDev = Int32(devIndex)
  if cDev > 0
    if enumDeviceIsOpened(myDev)
      error("Error opening device, already in use.")
    end
    hdwf = deviceOpen(myDev)
    if hdwf == Int32(0)
      error("Failed to open the requested device.")
    end
  else
    error("No devices available.")
  end

  bmin,bmax = analogInBufferSizeInfo(hdwf)
  show(("Buffer Size, Min:",bmin,"Max:",bmax))

  chVoltMin,chVoltMax,chSteps = analogInChannelRangeInfo(hdwf)
  show(("chVoltMin:",chVoltMin,"chVoltMax:",chVoltMax,"chSteps:",chSteps))
  chCount = analogInChannelCount(hdwf)
  show(("chCount:",chCount))

  deviceClose(hdwf)
  nothing
end

caps()
