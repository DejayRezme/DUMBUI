
local _, addonTable = ...
local DumbUI = addonTable.DumbUI

local L = LibStub("AceLocale-3.0"):GetLocale(DumbUI.name)
local DB
local iconLDB
local icon

function DumbUI:MinimapButtonInitialize()
	DB = DumbUI.db.profile

	iconLDB = LibStub("LibDataBroker-1.1"):NewDataObject(DumbUI.name, {
		type = "launcher",
		text = DumbUI.name,
		icon = "Interface\\AddOns\\DumbUI\\Images\\minimapIcon",
		OnClick = function(_, button) DumbUI:MinimapOnClick(button) end,
		OnTooltipShow = function(tooltip) DumbUI:MinimapOnTooltipShow(tooltip) end,
	})

	icon = LibStub("LibDBIcon-1.0")
	icon:Register(DumbUI.name, iconLDB, DB.minimapButtonVisible)
end

function DumbUI:MinimapOnClick(button)
	if InCombatLockdown() then
		return
	end

	PlaySound(SOUNDKIT.IG_CHAT_SCROLL_DOWN)

	if button == "LeftButton" then
		if InterfaceOptionsFrame:IsShown() then
			InterfaceOptionsFrame:Hide();
		else
			InterfaceOptionsFrame_OpenToCategory(DumbUI.name)
			--InterfaceOptionsFrame_OpenToCategory(DumbUI.name)
		end
	elseif button == "RightButton" then
		-- whatever should we do?
	end
end

function DumbUI:MinimapOnTooltipShow(tooltip)
	tooltip:SetText(DumbUI.name, 1, 1, 1)
	--the formatting for the following strings is such that the key combo is in yellow, and the description is in white. This helps it be more readable at a glance
	--another route would be to use AddDoubleLine, to have a left justified string and a right justified string on the same line
	tooltip:AddLine(L["Left-Click"] .. ": " .. "|cFFFFFFFF"..L["Configure Bars"])
	tooltip:AddLine(L["Right-Click"] .. ": " .. "|cFFFFFFFF"..L["Configure Buttons"])
	tooltip:AddLine(L["Shift"] .. " + " .. L["Left-Click"] .. ": " .. "|cFFFFFFFF"..L["Toggle Keybind Mode"])
	tooltip:AddLine(L["Shift"] .. " + " .. L["Right-Click"] .. ": " .. "|cFFFFFFFF"..L["Open the Interface Menu"])

	tooltip:Show()
end

function DumbUI:MinimapToggleButton()
	if (DB.minimapButtonVisible) then
		icon:Hide(DumbUI.name)
		DB.minimapButtonVisible = false
	elseif (not DB.minimapButtonVisible) then
		icon:Show(DumbUI.name)
		DB.minimapButtonVisible = false
	end
end
