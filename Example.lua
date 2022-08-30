local Sew = loadstring(game.ReplicatedStorage.Packages.Sew) or game.ReplicatedStorage.Packages.Sew

Sew.CreateVar({
	["Type"] = "Int",
	["Name"] = "Value",
	["Value"] = 0
})

Sew.CreateService({["Name"] = "SwordService"})
local SwordService = Sew.Services["SwordService"]

Sew.CreateController({
	["Name"] = "SwordController",
	["ParentService"] = Sew.Services["SwordService"],
	["Event"] = function(args)
		print(args)
		Value.Value += args
	end)
})

local args = 5

Sew.Controllers["SwordController"]:Fire(args)

print(Sew.Vars["Value"])
