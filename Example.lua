local Sew = require(game.ReplicatedStorage.Packages.Sew)

print(Sew)

Sew.CreateVar({
	["Type"] = "Int",
	["Name"] = "Value",
	["Value"] = 0
})

Sew.CreateService("SwordService")
local SwordService = Sew.Services.SwordService

Sew.CreateController({
	["Name"] = "SwordController",
	["ParentService"] = SwordService,
	["Event"] = function(args)
		print(args)
		Value.Value += args
	end)
})

for i, v in pairs(Sew.Services:GetDecendants()) do
	print(v.Name, v.Parent)
end

for i, v in pairs(Sew.Vars:GetChildren()) do
	print(v.Name, v.Parent)
end

local args = 5

SwordService.SwordController:Fire(args)

print(Sew.Vars["Value"])
