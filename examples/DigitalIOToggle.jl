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

  digitalIOOutputEnableSet(hdwf, UInt32(0x0001))
  # Toggle DigitalIO pin 0 as fast as possible
  for i in 1:100000
    digitalIOOutputSet(hdwf, UInt32(0x01))
    digitalIOOutputSet(hdwf, UInt32(0x00))
  end

  deviceClose(hdwf)
end

go()
