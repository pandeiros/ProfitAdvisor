-- #TODO Copyright here

-- #TODO Options to implement
-- - [y/n] Include recipes from future phases
-----------------------------

OptionsTable = {
    name = PA_ADDON_NAME,
    handler = PA,
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
            desc = 'Open PA configuration window',
            func = 'OpenConfig',
        },

        toggle = {
            type = "toggle",
            name = "Enable/Disable toggle",
            desc = "Enable/disable the PA addon",
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
    Frames:OpenConfigFrame()
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

----------------------------------------------------------

    -- for i=1,GetNumTradeSkills() do
    --     _, kind, _, open = GetTradeSkillInfo(i);
    --     if (kind ~= "header") then
    --         item = GetTradeSkillItemLink(i);
            
    --         minMade, maxMade = GetTradeSkillNumMade(i);
    --         itemRecipe = GetTradeSkillRecipeLink(i);
    --         if item then
    --             -- _, item = GuildAds_ExplodeItemRef(item);
    --             -- tmp[item]=true;
    --             -- don't share cooldown, causes too much update
    --             --[[
    --             cooldown = GetTradeSkillCooldown(i) 
    --             if cooldown then
    --                 cooldown = cooldown / 60 + GuildAdsDB:GetCurrentTime();
    --             end;
    --             ]]
    --             -- _, itemRecipe = GuildAds_ExplodeItemRef(itemRecipe);
    --             q=nil;
    --             if minMade~=1 or maxMade~=1 then
    --                 q=tostring(minMade);
    --                 if maxMade~=minMade then
    --                     q=q.."-"..tostring(maxMade);
    --                 end
    --             end
                
    --             -- if not (t[item] and t[item].e and t[item].q) then
    --             -- if not (t[item]) then
    --             --     self:set(GuildAds.playerName, item, { s=skillId, e=itemRecipe, q=q });
    --             --     added = added + 1
    --             -- elseif not t[item].s then
    --             --     t[item].s = skillId
    --             -- end
    --         end
    --     -- else
    --     --     fullListShown = fullListShown and open
    --     end
    -- end

    ----

    -- local recipeIDs = C_TradeSkillUI.GetAllRecipeIDs();
    -- local recipeInfo = {};
    -- for idx = 1, #recipeIDs do
    --     C_TradeSkillUI.GetRecipeInfo(recipeIDs[idx], recipeInfo);
    --     print(recipeInfo.recipeID, recipeInfo.name);
    -- end
end