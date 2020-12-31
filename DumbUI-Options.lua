
local _, addonTable = ...
local DumbUI = addonTable.DumbUI

local options = {
    name = DumbUI.name,
	handler = DumbUI,
	set = "setOptionValue",
	get = "getOptionValue",
	--set = DumbUI.setOptionValue,
	--get = DumbUI.getOptionValue,
    type = 'group',
    args = {
        msg = {
            type = 'input',
            name = 'My Message',
            desc = 'The message for my addon',
            --set = 'SetMyMessage',
			--get = 'GetMyMessage',
		},
		enable = {
			name = "Enable",
			desc = "Enables / disables the addon",
			type = "toggle",
			--set = function(info, val) DumbUI.db.profile.enabled = val end,
			--get = function(info) return DumbUI.db.profile.enabled end
		},
		moreoptions={
			name = "More Options",
			type = "group",
			args={
				-- more options go here
			}
		}
    },
}

function DumbUI:InitializeOptions()
	LibStub("AceConfig-3.0"):RegisterOptionsTable(DumbUI.name, options, {DumbUI.name, "dui"})
	options.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(DumbUI.db)

	LibStub("AceConfigDialog-3.0"):AddToBlizOptions(DumbUI.name, DumbUI.name)
end

function DumbUI:setOptionValue(info, value, ...)
	local nodeName = info[#info]
	DumbUI.db.profile[nodeName] = value
	print("setOptionValue() " .. nodeName .. " will be set to " .. tostring(value) )
end

function DumbUI:getOptionValue(info)
	local nodeName = info[#info]
	local value = DumbUI.db.profile[nodeName]
	print("getOptionValue() " .. nodeName .. " of type " .. tostring(info.type) .. " returns " .. tostring(value))
	print(" option.name: " .. info.option.name)
	return value
end

function DumbUI:GetMyMessage(info)
    return DumbUI.db.profile.myMessage
end

function DumbUI:SetMyMessage(info, input)
	print("set: " .. input)
    DumbUI.db.profile.myMessage = input
end