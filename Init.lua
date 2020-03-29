-- #TODO Copyright here

-- Libraries
AceAddon = LibStub("AceAddon-3.0");
AceConsole = LibStub("AceConsole-3.0");
AceConfig = LibStub("AceConfig-3.0");
AceDB = LibStub("AceDB-3.0");
AceDBOptions = LibStub("AceDBOptions-3.0");
AceEvent = LibStub("AceEvent-3.0");
AceGUI = LibStub("AceGUI-3.0");

-- Main addon object
_G.ProfitAdvisor = AceAddon:NewAddon("ProfitAdvisor", "AceEvent-3.0");

-- Main objects
_G.ProfitAdvisor.Data = {};
_G.ProfitAdvisor.Locale = {};
_G.ProfitAdvisor.Style = {};