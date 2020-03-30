-- #TODO Copyright here

local ProfitAdvisor = _G.ProfitAdvisor;
local Data = ProfitAdvisor.Data;
local Style = ProfitAdvisor.Style;
local Professions = ProfitAdvisor.Data.Professions;

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
    return tonumber(string.match(link, '(%d+)'));
end

function Data:GetItemVendorPrice(itemID)
    local itemSellPrice = 0;
    local _, _, _, _, _, _, _, _, _, _, itemSellPrice = GetItemInfo(itemID);
    return itemSellPrice;
end

function Data:GetItemAHData(itemID)
    return {};
end

function Data:PrepareTooltipData(itemID)
    local baseEntry = Data:ConstructTooltipEntry(nil, itemID, self:GetItemVendorPrice(itemID), self:GetItemAHData(itemID), 0, 0);

    self:PrepareEntriesForItem(itemID, baseEntry);
    return baseEntry;
end

function Data:PrepareEntriesForItem(itemID, parentEntry)
    -- 1. Get vendor and AH data for given item.
    -- if (parentEntry == nil or table.getn(parentEntry) <= 0) then
    --     parentEntry = Data:ConstructTooltipEntry(nil, itemID, self:GetItemVendorPrice(itemID), self:GetItemAHData(itemID), 0, 0);
    -- end -- else
        --Data:ConstructTooltipEntry(parentEntry, self:GetItemVendorPrice(itemID), self:GetItemAHData(itemID));
    -- end

    -- 2. Get all itemIDs (also required quantity and number of items crafted) given item is a reagent for.
    local reagentFor, reagentCount, craftedCount = Professions:FindItemsForReagent(itemID);

    if (table.getn(reagentFor) > 0) then
        for i,v in ipairs(reagentFor) do
            local reagentID = tonumber(v);
            self:ConstructTooltipEntry(parentEntry, reagentID, self:GetItemVendorPrice(reagentID), self:GetItemAHData(reagentID), reagentCount[i], craftedCount[i]);
            self:PrepareEntriesForItem(reagentID, parentEntry.reagentFor[getn(parentEntry.reagentFor)]);
        end
    end
end

function Data:ConstructTooltipEntry(parentEntry, inItemID, inVendorPrice, inAHData, inReagentsRequired, inCraftedItems)
    if (parentEntry) then
        if (not parentEntry.reagentFor) then
            parentEntry.reagentFor = {};
        end
        table.insert(parentEntry.reagentFor, self:ConstructTooltipEntry(nil, inItemID, inVendorPrice, inAHData, inReagentsRequired, inCraftedItems));
    else
        local entry = {
            itemID              = inItemID,
            vendorPrice         = inVendorPrice or 0,
            ahData              = inAHData or 0,
            reagentsRequired    = inReagentsRequired or 0,
            craftedItems        = inCraftedItems or 0,
            reagentFor = {},
        }    
        return entry;
    end
end