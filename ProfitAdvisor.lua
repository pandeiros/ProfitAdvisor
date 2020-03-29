-- ********************************************************
-- *                   Profit Advisor                     *
-- ********************************************************
-- *                                                      *
-- *  This addon is written and copyrighted by:           *
-- *    - Pandeiros (Pandeirosa @ EU-ZandalarTribe)       *
-- *                                                      *
-- ********************************************************

local ProfitAdvisor = _G.ProfitAdvisor;

-- Also, a brief note for more advanced authors: 
-- If for some reason your addon causes LoadAddon() to be called in the main chunk,
-- OnInitialize will fire prematurely for your addon, so you'll need to take other measures
-- to delay initializing AceDB since SavedVariables still won't be loaded.
function ProfitAdvisor:OnInitialize()
    self:Initialize();
end

function ProfitAdvisor:Initialize()
    if (type(self.init) ~= "boolean" or not self.init) then
        self.db = AceDB:New(PA_DB_NAME, PA_DB_DEFAULTS, true);
        self.devmode = false;
    end

    self.init = true;
end