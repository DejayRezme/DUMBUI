
local _, addonTable = ...

local DumbUI = LibStub("AceAddon-3.0"):NewAddon("MyAddon", "AceConsole-3.0")
addonTable.DumbUI = DumbUI

--addonTable.Neuron = LibStub("AceAddon-3.0"):NewAddon(CreateFrame("Frame", nil, UIParent), "Neuron", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0", "AceTimer-3.0")

function DumbUI:OnInitialize()
	-- Code that you want to run when the addon is first loaded goes here.
end

function DumbUI:OnEnable()
	-- Called when the addon is enabled
end

function DumbUI:OnDisable()
	-- Called when the addon is disabled
end