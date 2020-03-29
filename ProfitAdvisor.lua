-- ********************************************************
-- *                   Profit Advisor                     *
-- ********************************************************
-- *                                                      *
-- *  This addon is written and copyrighted by:           *
-- *    - Pandeiros (Pandeirosa @ EU-ZandalarTribe)       *
-- *                                                      *
-- ********************************************************

-- Also, a brief note for more advanced authors: 
-- If for some reason your addon causes LoadAddon() to be called in the main chunk,
-- OnInitialize will fire prematurely for your addon, so you'll need to take other measures
-- to delay initializing AceDB since SavedVariables still won't be loaded.
function PA:OnInitialize()
    self.db = AceDB:New(PA_DB_NAME, DB_DEFAULTS, true)

    self.devmode = false;
    -- self:InitCharDBData();
end

function PA:InitCharDBData()
    -- if (type(self.db.char.init) ~= "boolean" or self.db.char.init == false) then
    --     self.db.char.loginCount = 1;
    --     self.db.char.enabled = true;

    --     self.db.char.init = true;
    -- end
end

--------------------------------------------------------------------------------------------
-- -- Create our main table for this addon
-- SimpleCombatHud = SimpleCombatHud or {};

-- -- Create the frame that we will use for our events
-- SimpleCombatHud.frame = CreateFrame("Frame", "SimpleCombatHud", UIParent);
-- SimpleCombatHud.frame:SetFrameStrata("BACKGROUND");
-- SimpleCombatHud.frame:RegisterEvent("PLAYER_TARGET_CHANGED");

-- -- Override the OnEvent() method to dispatch events to our processing functions.
-- -- Notice first argument is self referring to the frame allowing use of colon (:) notation.
-- SimpleCombatHud.frame:SetScript("OnEvent", function(self, event, ...) 
--     if self[event] then 
--         return self[event](self, ...) 
--     end 
-- end);

-- function SimpleCombatHud.frame:PLAYER_TARGET_CHANGED()
--     if (UnitExists("target")) then
--         ChatFrame1:AddMessage("VISIBLE")
--     else
--         ChatFrame1:AddMessage("HIDDEN")
--     end
-- end

-- PA = AceAddon:NewAddon("PA", "AceEvent-3.0");
  
-- function PA:OnEnable()
--     AceConsole:Print(ChatFrame1, "Hello, World!")
-- end
  
-- function PA:OnDisable()
--     ChatFrame1:AddMessage("DISABLE")
-- end

-- AceConsole:RegisterChatCommand("pa", "ProcessConsoleCommand")

-- function AceConsole:ProcessConsoleCommand(input)
--     if input == "" then
--         AceConsole:Print(ChatFrame1, "Welcome to Profit Advisor! Select on of the following commands:");
--     else
--         AceConsole:Print(ChatFrame1, "Selected PA command: " .. input);
--     end
-- end

-- local options = {
--     name = PA_ADDON_NAME,
--     handler = PA,
--     type = 'group',
--     args = {
--         config = {
--             type = 'input',
--             name = 'Profit Advisor config',
--             desc = 'open PA config',
--             set = 'SetConfig',
--             get = 'GetConfig',
--         },
--     },
-- }

-- function PA:SetConfig(info, input)
--     AceConsole:Print(ChatFrame1, input);
--     myMessageVar = input
-- end

-- function PA:GetConfig(info)
--     return myMessageVar
-- end

-- AceConfig:RegisterOptionsTable(PA_ADDON_NAME, options, {"pa", "profitadvisor"});

-- local activeProfile = PA.db:GetCurrentProfile()
-- local numProfiles = PA.db:GetProfiles()

-- local EventFrame = CreateFrame("Frame")
-- EventFrame:RegisterEvent("PLAYER_LOGIN")
-- EventFrame:SetScript("OnEvent", function(self,event,...)
-- 	if type(PA.db.char.LoginCount) ~= "number" then
--         PA:InitCharacterData();
-- 		ChatFrame1:AddMessage("WhyHelloThar " .. UnitName("Player")..". I do believe this is the first time we've met. Nice to meet you!")
--     else
--         local LoginCount = PA.db.char.LoginCount;
-- 		if LoginCount == 1 then
-- 			ChatFrame1:AddMessage("WhyHelloThar " .. UnitName("Player")..". How nice to see you again. I do believe I've seen you " .. LoginCount .. " time before.")
-- 		else
-- 			ChatFrame1:AddMessage("WhyHelloThar " .. UnitName("Player")..". How nice to see you again. I do believe I've seen you " .. LoginCount .. " times before.")
-- 		end
--         PA.db.char.LoginCount = PA.db.char.LoginCount + 1;
-- 	end
-- end)

--------------------------------------------------------------
