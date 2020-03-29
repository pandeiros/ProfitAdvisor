-- TODO Copyright here

-- Grayscale
COLOR_WHITE             = "FFFFFF";       
COLOR_GRAY_10           = "E6E6E6";
COLOR_GRAY_20           = "CCCCCC";
COLOR_GRAY_30           = "B3B3B3";
COLOR_GRAY_40           = "999999";
COLOR_GRAY_50           = "808080";
COLOR_GRAY_60           = "666666";
COLOR_GRAY_70           = "4D4D4D";
COLOR_GRAY_80           = "333333";
COLOR_GRAY_90           = "1A1A1A";
COLOR_BLACK             = "000000"; 

-- Red shades
COLOR_RED               = "AC3C3C";
COLOR_RED_LIGHTER       = "FFAEAE";
COLOR_RED_LIGHT         = "D56E6E";
COLOR_RED_DARK          = "841A1A";
COLOR_RED_DARKER        = "590202";

-- Blue shades
COLOR_BLUE              = "0F64A6";
COLOR_BLUE_LIGHTER      = "5491BF";
COLOR_BLUE_LIGHT        = "3278AD";
COLOR_BLUE_DARK         = "084D83";
COLOR_BLUE_DARKER       = "053C67";

-- Yellow shades
COLOR_YELLOW            = "AC7C3C";
COLOR_YELLOW_LIGHTER    = "FFDCAE";
COLOR_YELLOW_LIGHT      = "D5A96E";
COLOR_YELLOW_DARK       = "84561A";
COLOR_YELLOW_DARKER     = "593402";

-- Green shades
COLOR_GREEN             = "308930";
COLOR_GREEN_LIGHTER     = "8BCD8B";
COLOR_GREEN_LIGHT       = "58AB58";
COLOR_GREEN_DARK        = "156915";
COLOR_GREEN_DARKER      = "024702";

-- Purple shades
COLOR_PURPLE            = "652A71";
COLOR_PURPLE_LIGHTER    = "A074A9";
COLOR_PURPLE_LIGHT      = "814A8D";
COLOR_PURPLE_DARK       = "4B1357";
COLOR_PURPLE_DARKER     = "31033A";

-- Orange shades
COLOR_ORANGE            = "AC523C";
COLOR_ORANGE_LIGHTER    = "FFBDAE";
COLOR_ORANGE_LIGHT      = "D5826E";
COLOR_ORANGE_DARK       = "842E1A";
COLOR_ORANGE_DARKER     = "591302";

-- Styles
DEFAULT_STYLE = {
    accentColor = COLOR_BLUE_LIGHT,
    fontColot = COLOR_GRAY_10,
}

-- Adds FF at the beginning.
function Color(hexColor)
    if (string.len(hexColor) == 6) then
        return "FF" .. hexColor;
    elseif (string.len(hexColor) == 8) then
        return hexColor;
    end
        
    return "FFFF0000";
end

-- Construct hex color with given alphaValue <0, 1>.
function ColorAlpha(hexColor, alphaValue)
    if (type(alphaValue) ~= "number") then
        return "FF" .. hexColor;
    end

    alphaValue = Clamp(alphaValue, 0.0, 1.0);
    alphaValue = math.floor(255 * alphaValue);
    hexValue = DECToHEX(alphaValue);
    hexValue = hexValue:gsub("0x","");

    return hexValue .. hexColor;
end

function GetColorStr(hexColor, str)
    if (string.len(hexColor) == 6) then
        hexColor = Color(hexColor);
    end

    return "|c" .. hexColor .. str .. "|r";
end

function HEXToRGB(hex)
    local hex = hex:gsub("#", "");
    hex = hex:gsub("0x", "");
    
    if hex:len() == 3 then
		return (tonumber("0x"..hex:sub(1,1))*17)/255, (tonumber("0x"..hex:sub(2,2))*17)/255, (tonumber("0x"..hex:sub(3,3))*17)/255;
    else
		return tonumber("0x"..hex:sub(1,2))/255, tonumber("0x"..hex:sub(3,4))/255, tonumber("0x"..hex:sub(5,6))/255;
    end
end

function RGB(r, g, b)
    return {r, g, b};
end

function UnwrapRGB(rgb)
    return rgb[0], rgb[1], rgb[2];
end

function RGBToHEX(rgb)
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