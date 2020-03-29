-- #TODO Copyright here

local ProfitAdvisor = _G.ProfitAdvisor;

local Frames = ProfitAdvisor.Frames;

-- #TODO Options to implement
-- - [y/n] Include recipes from future phases
-----------------------------

local OptionsTable = {
    name = PA_ADDON_NAME,
    handler = ProfitAdvisor,
    type = 'group',
    args = {
        devmode = {
            hidden = "GetDevModeToggleHidden",
            guiHidden = true,
            type = "toggle",
            name = "Development mode toggle",
            desc = "Enable/disable development mode",
            set = "SetDevModeToggle",
            get = "GetDevModeToggle",
            order = 1,
        },

        reset = {
            hidden = "GetDevModeToggleHidden",
            guiHidden = true,
            type = "execute",
            name = "Data reset",
            desc = "Reset all data to default state",
            func = "ResetAllData",
            order = 2,
            confirm = true,
        },

        config = {
            guiHidden = true,
            type = 'execute',
            name = 'Profit Advisor config',
            desc = 'Open Profit Advisor configuration window',
            func = 'OpenConfig',
        },

        toggle = {
            type = "toggle",
            name = "Enable/Disable toggle",
            desc = "Enable/disable the Profit Advisor addon",
            set = "SetEnableToggle",
            get = "GetEnableToggle",
        },

        test = {
            guiHidden = true,
            type = 'execute',
            name = 'Test',
            desc = 'Test command',
            func = 'TestCommand',
        },
    },
}

AceConfig:RegisterOptionsTable(PA_ADDON_NAME, OptionsTable, {"pa", "profitadvisor"});
OptionsTable.args.profile = AceDBOptions:GetOptionsTable(PA_DB_NAME)

-- Development mode
function ProfitAdvisor:GetDevModeEnabled()
    return (PA_DEV_MODE_ENABLED and not self:GetDevModeToggleHidden());
end

function ProfitAdvisor:GetDevModeToggleHidden()
    return not self.devmode;
end

function ProfitAdvisor:SetDevModeToggle(info, val)
    if (not PA_DEV_MODE_ENABLED) then
        return
    end
    
    self.devmode = val;
    self:Printf("Development mode %s.", ifte(val, "enabled", "disabled"));
end

function ProfitAdvisor:GetDevModeToggle(info)
    return self.devmode;
end

-- Reset
function ProfitAdvisor:ResetAllData(info)
    if (not self:GetDevModeEnabled()) then
        return
    end

    self:Print("Resetting data...");

    self.db:ResetDB(DEFAULT_DB_NAME);

    ProfitAdvisorDB = nil;
    ProfitAdvisorCharacterDB = nil;
end

-- Config
function ProfitAdvisor:OpenConfig(info)
    -- Frames:OpenConfigFrame();
    Frames:OpenMainFrame();
end

-- Enable toggle
function ProfitAdvisor:SetEnableToggle(info, val)
    self.db.char.enabled = val;
    self:Printf("%s %s.", PA_ADDON_NAME, ifte(val, "enabled", "disabled"));
end

function ProfitAdvisor:GetEnableToggle(info)
    return self.db.char.enabled;
end

-- Test
function ProfitAdvisor:TestCommand(info)
    local name, type;
    for i=1, GetNumTradeSkills() do
       name, type, _, _, _, _ = GetTradeSkillInfo(i);
    --    desc = GetTradeSkillDescription(i);
       if (name and type ~= "header") then
          DEFAULT_CHAT_FRAME:AddMessage("Found: "..name);
          
        local numReagents = GetTradeSkillNumReagents(i);
        local totalReagents = 0;
        for k=1, numReagents, 1 do
            local reagentName, reagentTexture, reagentCount, playerReagentCount = GetTradeSkillReagentInfo(i, k);
            totalReagents = totalReagents + reagentCount;
            if (reagentName ~= nil) then
                DEFAULT_CHAT_FRAME:AddMessage("- " .. reagentName);
                -- local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount = GetItemInfo(reagentName);
                -- message(sName..","..iRarity..","..sType);    
            end
        end
       end
    end
end