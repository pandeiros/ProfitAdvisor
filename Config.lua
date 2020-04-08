-- #TODO Copyright here

local ProfitAdvisor = _G.ProfitAdvisor;
local Auctions = ProfitAdvisor.Data.Auctions;

-- Dev mode
PA_DEV_MODE_ENABLED = true;

-- Commonly used variables
PA_ADDON_NAME = "Profit Advisor";
PA_DB_NAME = "ProfitAdvisorDB";
PA_DB_CHAR_NAME = "ProfitAdvisorCharacterDB";
PA_CURRENT_PHASE = 3;

-- Events stubs
function ProfitAdvisor:PLAYER_LOGIN()               self:PlayerLogin();         end
function ProfitAdvisor:AUCTION_HOUSE_SHOW()         self:AuctionHouseShow();      end
function ProfitAdvisor:AUCTION_HOUSE_CLOSED()       self:AuctionHouseClosed();      end
function ProfitAdvisor:AUCTION_ITEM_LIST_UPDATE()   self:AuctionItemListUpdate();      end

-- Event registration
ProfitAdvisor:RegisterEvent("PLAYER_LOGIN");
ProfitAdvisor:RegisterEvent("AUCTION_HOUSE_SHOW");
ProfitAdvisor:RegisterEvent("AUCTION_HOUSE_CLOSED");
ProfitAdvisor:RegisterEvent("AUCTION_ITEM_LIST_UPDATE");