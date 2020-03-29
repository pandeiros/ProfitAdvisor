-- #TODO Copyright here

-- Dev mode
PA_DEV_MODE_ENABLED = true;

-- Libraries
AceAddon = LibStub("AceAddon-3.0");
AceConsole = LibStub("AceConsole-3.0");
AceConfig = LibStub("AceConfig-3.0");
AceDB = LibStub("AceDB-3.0");
AceDBOptions = LibStub("AceDBOptions-3.0");
AceEvent = LibStub("AceEvent-3.0");
AceGUI = LibStub("AceGUI-3.0");

-- Commonly used variables
PA_ADDON_NAME = "Profit Advisor";
PA_DB_NAME = "ProfitAdvisorDB";
PA_DB_CHAR_NAME = "ProfitAdvisorCharacterDB";
PA_CURRENT_PHASE = 3;

-- Main addon object
PA = AceAddon:NewAddon("PA", "AceEvent-3.0");

-- Events stubs
function PA:PLAYER_LOGIN()
    self:PlayerLogin();
end

-- Event registration
PA:RegisterEvent("PLAYER_LOGIN");
