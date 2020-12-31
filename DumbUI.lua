
-- bit of an ugly pattern, wow passes two variables in ellipses, second is a table unique to this addon
local addonName, addonTable = ...

local DumbUI = LibStub("AceAddon-3.0"):NewAddon(addonName, "AceConsole-3.0") --, "AceEvent-3.0", "AceHook-3.0", "AceTimer-3.0")
DumbUI.name = addonName
DumbUI.dbName = DumbUI.name .. "DB"
addonTable.DumbUI = DumbUI


local interfaceOptions = {
    name = DumbUI.name,
    handler = DumbUI,
    type = 'group',
    args = {
        msg = {
            type = 'input',
            name = 'My Message',
            desc = 'The message for my addon',
            set = 'SetMyMessage',
            get = 'GetMyMessage',
        },
    },
}

function DumbUI:OnInitialize()
	-- Code that you want to run when the addon is first loaded goes here.
	self.db = LibStub("AceDB-3.0"):New(DumbUI.dbName)
	LibStub("AceConfig-3.0"):RegisterOptionsTable(DumbUI.name, interfaceOptions, {DumbUI.name, "dui"})

	self:MinimapButtonInitialize()
end

function DumbUI:OnEnable()
	-- Called when the addon is enabled
end

function DumbUI:OnDisable()
	-- Called when the addon is disabled
end

function DumbUI:GetMyMessage(info)
	print("get: " .. myMessageVar)
    return myMessageVar
end

function DumbUI:SetMyMessage(info, input)
	print("set: " .. input)
    myMessageVar = input
end

