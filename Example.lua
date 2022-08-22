local Sew = loadstring(game.ReplicatedStorage.Packages.Sew) or game.ReplicatedStorage.Packages.Sew
local Vars = Sew.Intvars() or Sew.Boolvars() or Sew.Brickvars() or Sew.CFramevars() or Sew.Colorvars() or Sew.Objectvars() or Sew.Numbervars() or Sew.Rayvars() or Sew.Vector3vars() or Sew.Stringvars()
local getVars = Sew.GetVars()
local Sew.Services = Sew.GetAllServices()
local Sew.Controllers = Sew.GetAllControllers()

Sew.CreateVar({
	["Type"] = "Value",
	["Name"] = "Int",
	["Value"] = 0
})

local Value =  Sew.GetVar("Value")

Sew.CreateService({["Name"] = "SwordService"})
local SwordService = Sew.GetService("SwordService")

Sew.CreateController({
	["Name"] = "SwordController",
	["ParentService"] = SwordService,
	["Invoke"] = function(args)
		print(args)
		Value.Value += args
	end)
})

local args = 5

Sew.GetController("SwordController", "SwordService"):InvokeServer(args)

print(Value.Value)
