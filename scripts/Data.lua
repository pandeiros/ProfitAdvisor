-- #TODO Copyright here

local ProfitAdvisor = _G.ProfitAdvisor;
local Data = ProfitAdvisor.Data;
local Style = ProfitAdvisor.Style;

-- Database defaults
PA_DB_DEFAULT_PROFILE_NAME = "Default";
PA_DB_DEFAULTS = {
    profile = {
        style = Style:GetDefaultStyle(),
    },

    char = {
        enabled = true,
        loginCount = 0,
    }
}

function Data:GetItemIDFromLink(link)
    -- example: |cffffffff|Hitem:4592::::::::12:::::::|h[Longjaw Mud Snapper]|h|r
    -- #TODO Does it work with different colors than ffffff ?
    return string.match(link, '(%d+)');
end

function Data:GetItemVendorPrice(itemID)
    local itemSellPrice = 0;
    _, _, _, _, _, _, _, _, _, _, itemSellPrice = GetItemInfo(itemID);
    return itemSellPrice;
end

function Data:PrepareTooltipData(itemID)
