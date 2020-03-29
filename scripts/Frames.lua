-- #TODO Copyright here

local ProfitAdvisor = _G.ProfitAdvisor;
local Colors = ProfitAdvisor.Style.Colors;
local Data = ProfitAdvisor.Data;

local Frames = {};
local Tooltip = {};
PA_MainFrame = AceGUI:Create("Frame");

ProfitAdvisor.Frames = Frames;
ProfitAdvisor.Frames.Tooltip = Tooltip;
ProfitAdvisor.Frames.MainFrame = PA_MainFrame;

----------------------------------------------------------
-- Main frame
----------------------------------------------------------

AceGUI:Release(PA_MainFrame);

function PA_MainFrame:GetName()
    return "ProfitAdvisor_MainFrame";
end

function PA_MainFrame:Draw()
    self:SetTitle("Profit Advisor");
    self:SetStatusText("");
    self:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end);
    self:SetLayout("Fill");

    self:DrawTabs();

    self:AddChild(self.TabGroup);
end

-- Callback function for OnGroupSelected
local function SelectGroup(container, event, group)
    container:ReleaseChildren();
    if group == "SettingsTab" then
        PA_MainFrame:DrawSettingsTab(container);
    elseif group == "OtherTab" then
        PA_MainFrame:DrawOtherTab(container);
    end
end

function PA_MainFrame:DrawTabs()
    self.TabGroup = AceGUI:Create("TabGroup");
    self.TabGroup:SetLayout("Flow");
    self.TabGroup:SetTabs({
        {text="Settings", value="SettingsTab"}, 
        {text="Other", value="OtherTab"}});
    self.TabGroup:SetCallback("OnGroupSelected", SelectGroup);
    self.TabGroup:SelectTab("SettingsTab");
end

function PA_MainFrame:DrawSettingsTab(container)
    local description = AceGUI:Create("Label");
    description:SetText("This is Settings Tab");
    description:SetFullWidth(true);
    container:AddChild(description);
    
    local button = AceGUI:Create("Button");
    button:SetText("Button");
    button:SetWidth(200);
    container:AddChild(button);
end
    
function PA_MainFrame:DrawOtherTab(container)
    local description = AceGUI:Create("Label");
    description:SetText("This is Other Tab");
    description:SetFullWidth(true);
    container:AddChild(description);
    
    local button = AceGUI:Create("Button");
    button:SetText("Button");
    button:SetWidth(200);
    container:AddChild(button);
end

----------------------------------------------------------

function Frames:OpenMainFrame()
    self.MainFrame = AceGUI:Create("Frame");
    table.insert(UISpecialFrames, "PA_MainFrame");
    self.MainFrame:Draw();
end

function Frames:CloseMainFrame()
    if (self.MainFrame) then
        self.MainFrame:Release();
    end
end

function Frames:OpenConfigFrame()
    -- self.ConfigFrame = AceGUI:Create("Frame");
    -- table.insert(UISpecialFrames, "PA_ConfigFrame");
    -- self.ConfigFrame:Draw();
end

function Frames:CloseMainFrame()
    -- if (self.ConfigFrame) then
    --     self.ConfigFrame:Release();
    -- end
end

-----------------------------------------------------------

function Tooltip:AddItemInfo(tooltip)
    local style = ProfitAdvisor.db.profile.style;
    
    local name, link = tooltip:GetItem();
    local itemID = Data:GetItemIDFromLink(link);
    local linesToShow = Data:PrepareTooltipData(itemID);


    local vendorPrice = Data:GetItemVendorPrice(itemID);

    local bShouldShowInfo = (vendorPrice > 0);
    if (bShouldShowInfo) then
        tooltip:AddLine(" ", Colors:HEXToRGB(style.mainColor));
        tooltip:AddLine(PA_ADDON_NAME, Colors:HEXToRGB(style.mainColor));
        if (vendorPrice > 0) then
            SetTooltipMoney(tooltip, vendorPrice, "STATIC", Colors:GetColorStr(style.accentColor, "Vendor price:"), "");
        end    
    end
end