-- #TODO Copyright here

local ProfitAdvisor = _G.ProfitAdvisor
local Colors = ProfitAdvisor.Style.Colors;

function ProfitAdvisor:PlayerLogin()
	self:Initialize();
	self:PrintWelcomeMessage();
end

function ProfitAdvisor.ToolTipHook(tooltip)
	ProfitAdvisor.Frames.Tooltip:AddItemInfo(tooltip);
end

GameTooltip:HookScript("OnTooltipSetItem", ProfitAdvisor.ToolTipHook);
ItemRefTooltip:HookScript("OnTooltipSetItem", ProfitAdvisor.ToolTipHook);