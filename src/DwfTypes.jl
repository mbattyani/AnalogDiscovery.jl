typealias Hdwf Cint

@enum(ENUMFILTER,
  ENUMFILTERALL=0,
  ENUMFILTEREEXPLORER=1,
  ENUMFILTERDISCOVERY=2)

@enum(DEVID,
  DEVIDEEXPLORER=0,
  DEVIDDISCOVERY=1,
  DEVIDDISCOVERY2=2)

@enum(DEVVER,
  DEVVEREEXPLORERCDISCOVERYB=2,
  DEVVEREEXPLORERE=4,
  DEVVEREEXPLORERF=5,
  DEVVERDISCOVERYA=1,
  DEVVERDISCOVERYC=3)

@enum(DWFENUMCONFIGINFO,
  DECIANALOGINCHANNELCOUNT=1,
  DECIANALOGOUTCHANNELCOUNT=2,
  DECIANALOGIOCHANNELCOUNT=3,
  DECIDIGITALINCHANNELCOUNT=4,
  DECIDIGITALOUTCHANNELCOUNT=5,
  DECIDIGITALIOCHANNELCOUNT=6,
  DECIANALOGINBUFFERSIZE=7,
  DECIANALOGOUTBUFFERSIZE=8,
  DECIDIGITALINBUFFERSIZE=9,
  DECIDIGITALOUTBUFFERSIZE=0)

@enum(DWFSTATE,
  DWFSTATEREADY=0,
  DWFSTATECONFIG=4,
  DWFSTATEPREFILL=5,
  DWFSTATEARMED=1,
  DWFSTATEWAIT=7,
  DWFSTATETRIGGEREDRUNNING=3,
  DWFSTATEDONE=2)
