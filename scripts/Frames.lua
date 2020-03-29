-- #TODO Copyright here

-- Config frame
ConfigFrame = AceGUI:Create("Frame");
AceGUI:Release(ConfigFrame);

function ConfigFrame:Draw()
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
        ConfigFrame:DrawSettingsTab(container);
    elseif group == "OtherTab" then
        ConfigFrame:DrawOtherTab(container);
    end
end

function ConfigFrame:DrawTabs()
    self.TabGroup = AceGUI:Create("TabGroup");
    self.TabGroup:SetLayout("Flow");
    self.TabGroup:SetTabs({
        {text="Settings", value="SettingsTab"}, 
        {text="Other", value="OtherTab"}});
    self.TabGroup:SetCallback("OnGroupSelected", SelectGroup);
    self.TabGroup:SelectTab("SettingsTab");
end

function ConfigFrame:DrawSettingsTab(container)
    local description = AceGUI:Create("Label");
    description:SetText("This is Settings Tab");
    description:SetFullWidth(true);
    container:AddChild(description);
    
    local button = AceGUI:Create("Button");
    button:SetText("Button");
    button:SetWidth(200);
    container:AddChild(button);
end
    
function ConfigFrame:DrawOtherTab(container)
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

-- General frames function
Frames = ProfitAdvisor:CreateObject("Frames");

function Frames:OpenConfigFrame()
    ConfigFrame = AceGUI:Create("Frame");
    table.insert(UISpecialFrames, "ConfigFrame");
    ConfigFrame:Draw();
end

function Frames:CloseConfigFrame()
    if (ConfigFrame) then
        ConfigFrame:Release();
    end
end

----------------------------------------------------------

-- -- function that draws the widgets for the first tab
-- local function DrawGroup1(container)
--     local desc = AceGUI:Create("Label")
--     desc:SetText("This is Tab 1")
--     desc:SetFullWidth(true)
--     container:AddChild(desc)
    
--     local button = AceGUI:Create("Button")
--     button:SetText("Tab 1 Button")
--     button:SetWidth(200)
--     container:AddChild(button)
-- end
    
-- -- function that draws the widgets for the second tab
-- local function DrawGroup2(container)
--     local desc = AceGUI:Create("Label")
--     desc:SetText("This is Tab 2")
--     desc:SetFullWidth(true)
--     container:AddChild(desc)
    
--     local button = AceGUI:Create("Button")
--     button:SetText("Tab 2 Button")
--     button:SetWidth(200)
--     container:AddChild(button)
-- end
    
-- -- Callback function for OnGroupSelected
-- local function SelectGroup(container, event, group)
--     container:ReleaseChildren()
--     if group == "tab1" then
--         DrawGroup1(container)
--     elseif group == "tab2" then
--         DrawGroup2(container)
--     end
-- end

-- -- Create the TabGroup
-- local tab =  AceGUI:Create("TabGroup")
-- tab:SetLayout("Flow")
-- -- Setup which tabs to show
-- tab:SetTabs({{text="Tab 1", value="tab1"}, {text="Tab 2", value="tab2"}})
-- -- Register callback
-- tab:SetCallback("OnGroupSelected", SelectGroup)
-- -- Set initial Tab (this will fire the OnGroupSelected callback)
-- tab:SelectTab("tab1")

-- -- add to the frame container
-- ConfigFrame:AddChild(tab)