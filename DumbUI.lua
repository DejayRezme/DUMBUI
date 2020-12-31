
-- bit of an ugly pattern, wow passes two variables in ellipses, second is a table unique to this addon
local addonName, addonTable = ...

local DumbUI = LibStub("AceAddon-3.0"):NewAddon(addonName, "AceConsole-3.0") --, "AceEvent-3.0", "AceHook-3.0", "AceTimer-3.0")
DumbUI.name = addonName
DumbUI.dbName = DumbUI.name .. "DB"
addonTable.DumbUI = DumbUI

local defaults = {
	profile = {
		optionA = true,
		optionB = false,
		suboptions = {
			subOptionA = false,
			subOptionB = true,
		},
	}
}

function DumbUI:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New(DumbUI.dbName, defaults, true)
	self.db.RegisterCallback(self, "OnProfileChanged", "RefreshConfig")
	self.db.RegisterCallback(self, "OnProfileCopied", "RefreshConfig")
	self.db.RegisterCallback(self, "OnProfileReset", "RefreshConfig")
	
	self:InitializeOptions()
	self:InitializeMinimapButton()
end

function DumbUI:RefreshConfig()
	print("DumbUI:RefreshConfig()")
	-- would do some stuff here
end

function DumbUI:OnEnable()
	print("DumbUI:OnEnable()")
	-- Called when the addon is enabled
end

function DumbUI:OnDisable()
	print("DumbUI:OnEnable()")
	-- Called when the addon is disabled
end
