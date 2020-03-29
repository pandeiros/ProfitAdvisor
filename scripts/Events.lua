-- #TODO Copyright here

function ProfitAdvisor:PlayerLogin()
	local loginCount = PA.db.char.loginCount;
	if loginCount == 0 then
		self:Printf("Hello there, %s! I do believe this is the first time we've met. Nice to meet you!", GetColorStr(self.db.profile.style.accentColor, UnitName("Player")));
	elseif loginCount == 1 then
		self:Printf("Hello there, %s! How nice to see you again. I do believe I've seen you %d time before.", GetColorStr(self.db.profile.style.accentColor, UnitName("Player")), loginCount);
	else
		self:Printf("Hello there, %s! How nice to see you again. I do believe I've seen you %d times before.", GetColorStr(self.db.profile.style.accentColor, UnitName("Player")), loginCount);
	end

	PA.db.char.loginCount = PA.db.char.loginCount + 1;
end

function PA.ToolTipHook(tooltip)
	local name, link = tooltip:GetItem();	-- = "|cffffffff|Hitem:4592::::::::12:::::::|h[Longjaw Mud Snapper]|h|r
	ProfitAdvisor:Print(test{10});
	ProfitAdvisor:Print(name .. ", " .. link .. "(" .. GetItemIDFromLink(link) .. ")");
	tooltip:AddLine("Profit Advisor", HEXToRGB(PA.db.profile.style.accentColor));
	SetTooltipMoney(tooltip, 12345, "STATIC", GetColorStr(PA.db.profile.style.accentColor, "Best deal:"), "");

	---------------------------------

	-- if not link then
	--   BVP:Debug(1, "No item link for % on %", name, t:GetName())
	--   return
	-- end
	-- local compactView = BVP.holdShiftForMore and not IsShiftKeyDown()
	-- local auctionData = {}
	-- if BVP.showAhdb and AuctionDB and AuctionDB.AHGetAuctionInfoByLink and not compactView then
	--   auctionData = AuctionDB:AHGetAuctionInfoByLink(link)
	-- end
	-- if auctionData.numAuctions then
	--   local sellers = ", "
	--   if auctionData.numSellers then -- compat with older AHDB addon
	-- 	if auctionData.hasUnknownSellers then
	-- 	  sellers = BVP:format(L[" (%+ sellers), "], auctionData.numSellers)
	-- 	else
	-- 	  sellers = BVP:format(L[" (% |4seller:sellers;), "], auctionData.numSellers)
	-- 	end
	--   end
	--   t:AddLine(BVP:format(L["AHDB last scan: % |4auction:auctions;"] .. sellers .. L["% |4item:total items;"],
	-- 					   auctionData.numAuctions, auctionData.quantity))
	-- end
	-- if BVP.showAhdbMinBid and auctionData.minBid then
	--   SetTooltipMoney(t, auctionData.minBid, "STATIC", L["AHDB minbid"], L[" (per item)"])
	-- end
	-- if auctionData.minBuyout then
	--   SetTooltipMoney(t, auctionData.minBuyout, "STATIC", L["AHDB buyout"], L[" (per item)"])
	-- end
	-- local _, _, _, _, _, _, _, itemStackCount, _, _, itemSellPrice = GetItemInfo(link)
	-- BVP:Debug(2, "% Item % indiv sell price % stack size % (%)", t:GetName(), name, itemSellPrice, itemStackCount, link)
	-- if not itemSellPrice or itemSellPrice <= 0 then
	--   BVP:Debug(1, "Bad/no price for % (%): %", name, link, itemSellPrice)
	--   return
	-- end
	-- if itemStackCount > 1 then
	--   local c = GetMouseFocus()
	--   local count = 1 -- default
	--   if c then
	-- 	-- This my finding to make it work for AH listings for instance
	-- 	local bn = c:GetName() and (c:GetName() .. "Count")
	-- 	BVP:Debug(3, "Mouse focus is on % % % % % %", c:GetName(), c:GetObjectType(), c.count, c.Count, c.Quantity, bn)
	-- 	count = c.count or (c.Count and c.Count:GetText()) or (c.Quantity and c.Quantity:GetText()) or
	-- 			  (bn and _G[bn] and _G[bn]:GetText())
	-- 	count = tonumber(count) or 1
	-- 	if count <= 1 then
	-- 	  count = 1
	-- 	end
	--   else
	-- 	BVP:Debug("Unexpected tooltip call without anything under it")
	--   end
	--   local curValue = count * itemSellPrice
	--   local maxValue = itemStackCount * itemSellPrice
	--   -- if/else getting kinda ugly here
	--   if compactView then
	-- 	if count > 1 then
	-- 	  if count == itemStackCount then
	-- 		SetTooltipMoney(t, maxValue, "STATIC", L["Vendors for:"],
	-- 						string.format(L[" (full stack of %d)"], itemStackCount))
	-- 	  else
	-- 		SetTooltipMoney(t, curValue, "STATIC", L["Vendors for:"],
	-- 						string.format(L[" (curr. stack of %d/%d)"], count, itemStackCount))
	-- 	  end
	-- 	else
	-- 	  SetTooltipMoney(t, itemSellPrice, "STATIC", L["Vendors for:"],
	-- 					  string.format(L[" (per; stacks to %d)"], itemStackCount))
	-- 	end
	--   elseif BVP.showFullStack then
	-- 	SetTooltipMoney(t, itemSellPrice, "STATIC", L["Vendors for:"], L[" (per item)"])
	-- 	if count > 1 and count ~= itemStackCount then
	-- 	  SetTooltipMoney(t, curValue, "STATIC", L["Vendors for:"], string.format(L[" (current stack of %d)"], count))
	-- 	end
	-- 	SetTooltipMoney(t, maxValue, "STATIC", L["Vendors for:"], string.format(L[" (full stack of %d)"], itemStackCount))
	--   else
	-- 	if count > 1 then
	-- 	  if count == itemStackCount then
	-- 		SetTooltipMoney(t, itemSellPrice, "STATIC", L["Vendors for:"], L[" (per item)"])
	-- 		SetTooltipMoney(t, maxValue, "STATIC", L["Vendors for:"],
	-- 						string.format(L[" (curr. full stack of %d)"], itemStackCount))
	-- 	  else
	-- 		SetTooltipMoney(t, itemSellPrice, "STATIC", L["Vendors for:"],
	-- 						string.format(L[" (per; stacks to %d)"], itemStackCount))
	-- 		SetTooltipMoney(t, curValue, "STATIC", L["Vendors for:"], string.format(L[" (current stack of %d)"], count))
	-- 	  end
	-- 	else
	-- 	  SetTooltipMoney(t, itemSellPrice, "STATIC", L["Vendors for:"],
	-- 					  string.format(L[" (per; stacks to %d)"], itemStackCount))
	-- 	end
	--   end
	-- else
	--   SetTooltipMoney(t, itemSellPrice, "STATIC", L["Vendors for:"], L[" (item doesn't stack)"])
	-- end
	-- BVP:Debug(2, "t is % : %", t:GetName(), t.numMoneyFrames)
	-- return true
  end
  
GameTooltip:HookScript("OnTooltipSetItem", PA.ToolTipHook);
ItemRefTooltip:HookScript("OnTooltipSetItem", PA.ToolTipHook);
  
