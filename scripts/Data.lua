-- #TODO Copyright here

local ProfitAdvisor = _G.ProfitAdvisor

-- Database defaults
PA_DB_DEFAULT_PROFILE_NAME = "Default";
PA_DB_DEFAULTS = {
    profile = {
        style = DEFAULT_STYLE,
    },

    char = {
        enabled = true,
        loginCount = 0,
    }
}

-- -- Item data variables
-- local ItemDB = {};
-- local ItemID = {};
-- ProfitAdvisor.Data.ItemDB = ItemDB;
-- ProfitAdvisor.Data.ItemID = ItemID;

-- function ProfitAdvisor:AddItemData(itemID, profession, minPhase, spellID, reagentFor, itemName)
--     self.ItemDB[itemID] = {
--         reagentFor      = reagentFor,       -- array of integers, or nil if not a reagent for anything
--         profession      = profession,       -- name of the profession this is crafted with, empty/nil if not craftable
--         phase           = minPhase,         -- WoW Classic phase this starts to be available
--         spellID         = spellID,          -- spell ID that crafts this, or nil if not craftable
--         name            = itemName,         -- (opt) string (we store a name because name from GetItemInfo is localized)
--     }

--     reagentFor = reagentFor or {0};
--     self.ItemIDs[itemID] = reagentFor;      -- maps item ID to all possible crafts this can be reagent for
-- end


----------------------------------------------------------
-- ALCHEMY
---- Flasks
-- ProfitAdvisor:AddItemData(6359 ,   "Leatherworking",   1,  12345,  {7837}, "Firefin Snapper");
---

-- data["Alchemy"] = {
-- 	name = ALIL["Alchemy"],
-- 	ContentType = PROF_CONTENT,
-- 	LoadDifficulty = NORMAL_DIFF,
-- 	TableType = PROF_ITTYPE,
-- 	items = {
-- 		{
-- 			name = AL["Flasks"],
-- 			[NORMAL_DIFF] = {
-- 				{ 1, 17635 }, --Flask of the Titans
-- 				{ 2, 17636 }, --Flask of Distilled Wisdom
-- 				{ 3, 17637 }, --Flask of Supreme Power
-- 				{ 4, 17638 }, --Flask of Chromatic Resistance
-- 				{ 16, 17634 }, --Flask of Petrification
-- 			},
-- 		},
-- 		{
-- 			name = AL["Transmutes"],
-- 			[NORMAL_DIFF] = {
-- 				{ 1, 17560 }, --Transmute: Fire to Earth
-- 				{ 2, 17565 }, --Transmute: Life to Earth
-- 				{ 4, 17561 }, --Transmute: Earth to Water
-- 				{ 5, 17563 }, --Transmute: Undeath to Water
-- 				{ 7, 17562 }, --Transmute: Water to Air
-- 				{ 9, 17564 }, --Transmute: Water to Undeath
-- 				{ 11, 17566 }, --Transmute: Earth to Life
-- 				{ 13, 17559 }, --Transmute: Air to Fire
-- 				{ 16, 17187 }, --Transmute: Arcanite
-- 				{ 17, 11479 }, --Transmute: Iron to Gold
-- 				{ 18, 11480 }, --Transmute: Mithril to Truesilver
-- 				{ 20, 25146 }, --Transmute: Elemental Fire
-- 			},
-- 		},
-- 		{
-- 			name = AL["Healing/Mana Potions"],
-- 			[NORMAL_DIFF] = {
-- 				{ 1, 17556 }, --Major Healing Potion
-- 				{ 2, 11457 }, --Superior Healing Potion
-- 				{ 3, 7181 }, --Greater Healing Potion
-- 				{ 4, 3447 }, --Healing Potion
-- 				{ 5, 2337 }, --Lesser Healing Potion
-- 				{ 6, 2330 }, --Minor Healing Potion
-- 				{ 8, 2332 }, --Minor Rejuvenation Potion
-- 				{ 10, 24366 }, --Greater Dreamless Sleep Potion
-- 				{ 12, 11458 }, --Wildvine Potion
-- 				{ 13, 4508 }, --Discolored Healing Potion
-- 				{ 16, 17580 }, --Major Mana Potion
-- 				{ 17, 17553 }, --Superior Mana Potion
-- 				{ 18, 11448 }, --Greater Mana Potion
-- 				{ 19, 3452 }, --Mana Potion
-- 				{ 20, 3173 }, --Lesser Mana Potion
-- 				{ 21, 2331 }, --Minor Mana Potion
-- 				{ 23, 22732 }, --Major Rejuvenation Potion
-- 				{ 25, 15833 }, --Dreamless Sleep Potion
-- 				{ 27, 24365 }, --Mageblood Potion
-- 			},
-- 		},
-- 		{
-- 			name = AL["Protection Potions"],
-- 			[NORMAL_DIFF] = {
-- 				{ 1, 17574 }, --Greater Fire Protection Potion
-- 				{ 2, 17576 }, --Greater Nature Protection Potion
-- 				{ 3, 17575 }, --Greater Frost Protection Potion
-- 				{ 4, 17578 }, --Greater Shadow Protection Potion
-- 				{ 5, 17577 }, --Greater Arcane Protection Potion
-- 				{ 7, 11453 }, --Magic Resistance Potion
-- 				{ 8, 3174 }, --Elixir of Poison Resistance
-- 				{ 16, 7257 }, --Fire Protection Potion
-- 				{ 17, 7259 }, --Nature Protection Potion
-- 				{ 18, 7258 }, --Frost Protection Potion
-- 				{ 19, 7256 }, --Shadow Protection Potion
-- 				{ 20, 7255 }, --Holy Protection Potion
-- 				{ 22, 3172 }, --Minor Magic Resistance Potion
-- 			},
-- 		},
-- 		{
-- 			name = AL["Util Potions"],
-- 			[NORMAL_DIFF] = {
-- 				{ 1, 11464 }, --Invisibility Potion
-- 				{ 2, 2335 }, --Swiftness Potion
-- 				{ 3, 6624 }, --Free Action Potion
-- 				{ 4, 3175 }, --Limited Invulnerability Potion
-- 				{ 5, 24367 }, --Living Action Potion
-- 				{ 6, 7841 }, --Swim Speed Potion
-- 				{ 8, 17572 }, --Purification Potion
-- 				{ 10, 17552 }, --Mighty Rage Potion
-- 				{ 11, 6618 }, --Great Rage Potion
-- 				{ 12, 6617 }, --Rage Potion
-- 				{ 16, 3448 }, --Lesser Invisibility Potion
-- 				{ 23, 11452 }, --Restorative Potion
-- 				{ 25, 17570 }, --Greater Stoneshield Potion
-- 				{ 26, 4942 }, --Lesser Stoneshield Potion
-- 			},
-- 		},
-- 		{
-- 			name = AL["Stat Elixirs"],
-- 			[NORMAL_DIFF] = {
-- 				{ 1, 24368 }, --Mighty Troll
-- 				{ 2, 3451 }, --Major Troll
-- 				{ 3, 3176 }, --Strong Troll
-- 				{ 4, 3170 }, --Weak Troll
-- 				{ 6, 17554 }, --Elixir of Superior Defense
-- 				{ 7, 11450 }, --Elixir of Greater Defense
-- 				{ 8, 3177 }, --Elixir of Defense
-- 				{ 9, 7183 }, --Elixir of Minor Defense
-- 				{ 11, 11472 }, --Elixir of Giants
-- 				{ 12, 3188 }, --Elixir of Ogre
-- 				{ 13, 2329 }, --Elixir of Lion
-- 				{ 16, 11467 }, --Elixir of Greater Agility
-- 				{ 17, 11449 }, --Elixir of Agility
-- 				{ 18, 2333 }, --Elixir of Lesser Agility
-- 				{ 19, 3230 }, --Elixir of Minor Agility
-- 				{ 21, 11465 }, --Elixir of Greater Intellect
-- 				{ 22, 3171 }, --Elixir of Wisdom
-- 				{ 24, 17573 }, --Greater Arcane Elixir
-- 				{ 25, 11461 }, --Arcane Elixir
-- 			},
-- 		},
-- 		{
-- 			name = AL["Special Elixirs"],
-- 			[NORMAL_DIFF] = {
-- 				{ 1, 26277 }, --Elixir of Greater Firepower
-- 				{ 2, 17555 }, --Elixir of the Sages
-- 				{ 5, 3450 }, --Elixir of Fortitude
-- 				{ 7, 17557 }, --Elixir of Brute Force
-- 				{ 8, 17571 }, --Elixir of the Mongoose
-- 				{ 10, 11477 }, --Elixir of Demonslaying
-- 				{ 16, 7845 }, --Elixir of Firepower
-- 				{ 17, 21923 }, --Elixir of Frost Power
-- 				{ 18, 11476 }, --Elixir of Shadow Power
-- 				{ 20, 2334 }, --Elixir of Minor Fortitude
-- 				{ 22, 8240 }, --Elixir of Giant Growth
-- 			},
-- 		},
-- 		{
-- 			name = AL["Misc Elixirs"],
-- 			[NORMAL_DIFF] = {
-- 				{ 1, 11478 }, --Elixir of Detect Demon
-- 				{ 2, 12609 }, --Catseye Elixir
-- 				{ 4, 22808 }, --Elixir of Greater Water Breathing
-- 				{ 6, 11468 }, --Elixir of Dream Vision

-- 				{ 16, 11460 }, --Elixir of Detect Undead
-- 				{ 17, 3453 }, --Elixir of Detect Lesser Invisibility
-- 				{ 19, 7179 }, --Elixir of Water Breathing
-- 			},
-- 		},
-- 		{
-- 			name = AL["Misc"],
-- 			[NORMAL_DIFF] = {
-- 				{ 1, 17632 }, --Alchemist's Stone
-- 				{ 3, 11473 }, --Ghost Dye
-- 				{ 5, 24266 }, --Gurubashi Mojo Madness
-- 				{ 7, 11466 }, --Gift of Arthas
-- 				{ 8, 3449 }, --Shadow Oil
-- 				{ 9, 3454 }, --Frost Oil
-- 				{ 10, 11451 }, --Oil of Immolation
-- 				{ 16, 11459 }, --Philosophers' Stone
-- 				{ 18, 11456 }, --Goblin Rocket Fuel
-- 				{ 23, 7836 }, --Blackmouth Oil
-- 				{ 24, 7837 }, --Fire Oil
-- 				{ 25, 17551 }, --Stonescale Oil
-- 			},
-- 		},
-- 	},
-- }