-- #TODO Copyright here

local ProfitAdvisor = _G.ProfitAdvisor;

-- Dev mode
PA_DEV_MODE_ENABLED = true;

-- Commonly used variables
PA_ADDON_NAME = "Profit Advisor";
PA_DB_NAME = "ProfitAdvisorDB";
PA_DB_CHAR_NAME = "ProfitAdvisorCharacterDB";
PA_CURRENT_PHASE = 3;

-- Events stubs
function ProfitAdvisor:PLAYER_LOGIN()
    self:PlayerLogin();
end

-- Event registration
ProfitAdvisor:RegisterEvent("PLAYER_LOGIN");