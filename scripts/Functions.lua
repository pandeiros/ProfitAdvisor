-- #TODO Copyright here

----------------------------
-- Logging helpers
----------------------------

-- Print to default tab. 
function PA:Print(...)
    AceConsole:Print(DEFAULT_CHAT_FRAME, ...);
end

-- Print formatted text to default tab.
function PA:Printf(format, ...)
    AceConsole:Printf(DEFAULT_CHAT_FRAME, format, ...);
end

----------------------------
-- Misc. functions
----------------------------

-- Lua-style ternary operator.
function ifte(condition, if_true, if_false)
    if condition then return if_true else return if_false end
end

-- Clamp
function Clamp(value, min, max)
	if (value > max) then
		return max;
	elseif (value < min) then
		return min;
	end

	return value;
end

-- Converts a decimal number to hexadecimal number.
function DECToHEX(decNumber)
	local hexNumber = "0x";
	local hex = "";
    while (decNumber > 0) do
        local index = math.fmod(decNumber, 16) + 1;
        decNumber = math.floor(decNumber / 16);
        hex = string.sub('0123456789ABCDEF', index, index) .. hex;			
    end

    if (string.len(hex) == 0) then
        hex = "0";
	end
	
	hexNumber = hexNumber .. hex;

    return hexNumber;
end

----------------------------
-- Objects/Tables
----------------------------

function PA:CreateObject(objectOrName, ...)
    local object,name
	local i=1
	if type(objectorname)=="table" then
		object=objectorname
		name=...
		i=2
	else
		name=objectorname
	end

    object = object or {}
    object.name = name
    
    return object
end

function GetAllData(t, prevData)
	-- if prevData == nil, start empty, otherwise start with prevData
	local data = prevData or {}
  
	-- copy all the attributes from t
	for k,v in pairs(t) do
	  data[k] = data[k] or v
	end
  
	-- get t's metatable, or exit if not existing
	local mt = getmetatable(t)
	if type(mt) ~='table' then
		return data;
	end
  
	-- get the __index from mt, or exit if not table
	local index = mt.__index
	if type(index) ~='table' then
		return data;
	end
  
	-- include the data from index into data, recursively, and return
	return GetAllData(index, data)
end

----------------------------
-- WoW API helpers
----------------------------

function GetItemIDFromLink(link)
    return string.match(link, '(%d+)');
end