-- TODO Copyright here

local ProfitAdvisor = _G.ProfitAdvisor;
local Style = ProfitAdvisor.Style;

local Colors = {};
ProfitAdvisor.Style.Colors = Colors;

-- Color groups (from lighest to darkest)
local COLOR_DATA = {
    ["Gray"]        = {"FFFFFF", "E6E6E6", "CCCCCC", "B3B3B3", "999999", "808080", "666666", "4D4D4D", "333333", "1A1A1A", "000000"},
    ["Red"]         = {"FFAEAE", "D56E6E", "AC3C3C", "841A1A", "590202"},
    ["Blue"]        = {"5491BF", "3278AD", "0F64A6", "084D83", "053C67"},
    ["Yellow"]      = {"FFFF42", "FFFF07", "D7D700", "AFAF00", "848400"},
    ["Green"]       = {"8BCD8B", "58AB58", "308930", "156915", "024702"},
    ["Purple"]      = {"A074A9", "814A8D", "652A71", "4B1357", "31033A"},
    ["Orange"]      = {"FFBDAE", "D5826E", "AC523C", "842E1A", "591302"},
    ["Rarity"]      = {"9D9D9D", "FFFFFF", "1EFF00", "0070DD", "A335EE", "FF8000", "E6CC80", "00CCFF"},
    ["App"]         = {
        ["Main"]    = "FF7D0A",
    }
}

COLOR_WHITE = "FFFFFF";

-- Styles
local DEFAULT_STYLE = {
    mainColor       = COLOR_DATA["App"]["Main"],
    accentColor     = COLOR_DATA["Blue"][1],
    fontColor       = COLOR_DATA["Gray"][2],
    vendorColor     = COLOR_DATA["Purple"][1],
    auctionColor    = COLOR_DATA["Blue"][1],
    craftColor      = COLOR_DATA["Orange"][2],
}

-- Operation quality.
local OP_QUALITY_COLORS = {
    COLOR_DATA["Rarity"][0],
    COLOR_DATA["Red"][3], 
    COLOR_DATA["Yellow"][2], 
    COLOR_DATA["Green"][2], 
    COLOR_DATA["Blue"][3],
    COLOR_DATA["Purple"][3]
}

function Style:GetDefaultStyle()
    return DEFAULT_STYLE;
end

function Style:GetColorData(shade, index)
    return COLOR_DATA[shade][index];
end

function Style:GetAppColor(appColorName)
    return COLOR_DATA["App"][appColorName];
end

-- rarity level between 0 and 7
function Style:GetRarityColor(rarityLevel)
    return COLOR_DATA["Rarity"][rarityLevel + 1];
end

-- operation quality between 1 and 6 (worst to best)
function Style:GetOperationQualityColor(opQuality)
    return OP_QUALITY_COLORS[opQuality];
end

----------------------------------------------------------
-- Color functions
----------------------------------------------------------

-- Adds FF at the beginning.
function Colors:GetColor(hexColor)
    if (string.len(hexColor) == 6) then
        return "FF" .. hexColor;
    elseif (string.len(hexColor) == 8) then
        return hexColor;
    end
        
    return "FFFF0000";
end

-- Construct hex color with given alphaValue <0, 1>.
function Colors:GetColorAlpha(hexColor, alphaValue)
    if (type(alphaValue) ~= "number") then
        return "FF" .. hexColor;
    end

    alphaValue = Clamp(alphaValue, 0.0, 1.0);
    alphaValue = math.floor(255 * alphaValue);
    hexValue = DECToHEX(alphaValue);
    hexValue = hexValue:gsub("0x","");

    return hexValue .. hexColor;
end

function Colors:GetColorStr(hexColor, str)
    if (string.len(hexColor) == 6) then
        hexColor = self:GetColor(hexColor);
    end

    return "|c" .. hexColor .. str .. "|r";
end

function Colors:HEXToRGB(hex)
    local hex = hex:gsub("#", "");
    hex = hex:gsub("0x", "");
    
    if hex:len() == 3 then
		return (tonumber("0x"..hex:sub(1,1))*17)/255, (tonumber("0x"..hex:sub(2,2))*17)/255, (tonumber("0x"..hex:sub(3,3))*17)/255;
    else
		return tonumber("0x"..hex:sub(1,2))/255, tonumber("0x"..hex:sub(3,4))/255, tonumber("0x"..hex:sub(5,6))/255;
    end
end

function Colors:RGB(r, g, b)
    return {r, g, b};
end

function Colors:UnwrapRGB(rgb)
    return rgb[0], rgb[1], rgb[2];
end

function Colors:RGBToHEX(rgb)
	local hexadecimal = '#';

	for key, value in pairs(rgb) do
		local hex = '';
		while (value > 0) do
			local index = math.fmod(value, 16) + 1;
			value = math.floor(value / 16);
			hex = string.sub('0123456789ABCDEF', index, index) .. hex;			
		end

		if (string.len(hex) == 0) then
			hex = '00';
		elseif (string.len(hex) == 1) then
			hex = '0' .. hex;
		end

		hexadecimal = hexadecimal .. hex;
	end

	return hexadecimal
end