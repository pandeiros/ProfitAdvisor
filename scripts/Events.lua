-- #TODO Copyright here

local ProfitAdvisor = _G.ProfitAdvisor
local Auctions = ProfitAdvisor.Data.Auctions;

function ProfitAdvisor:PlayerLogin()
	self:Initialize();
	self:PrintWelcomeMessage();
end

function ProfitAdvisor:AuctionHouseShow()
	Auctions:WindowOpened()
end

function ProfitAdvisor:AuctionHouseClosed()
	Auctions:WindowClosed();
end

function ProfitAdvisor:AuctionItemListUpdate()
	Auctions:AuctionItemListUpdate();
end
---------------------------------------------------------

function ProfitAdvisor.ToolTipHook(tooltip)
	ProfitAdvisor.Frames.Tooltip:AddItemInfo(tooltip);
end

GameTooltip:HookScript("OnTooltipSetItem", ProfitAdvisor.ToolTipHook);
ItemRefTooltip:HookScript("OnTooltipSetItem", ProfitAdvisor.ToolTipHook);