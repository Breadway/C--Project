local Sew = loadstring(game.ReplicatedStorage.Packages.Sew) or game.ReplicatedStorage.Packages.Sew
local Vars = Sew.Intvars() or Sew.Boolvars() or Sew.Brickvars() or Sew.CFramevars() or Sew.Colorvars() or Sew.Objectvars() or Sew.Numbervars() or Sew.Rayvars() or Sew.Vector3vars() or Sew.Stringvars()
local getVars = Sew.GetVars()
local getAllServices = Sew.GetAllServices()
local getAllControllers = Sew.GetAllControllers

local Bool Sew.CreateVar({
	["Type"] = "Bool",
	["Name"] = "Bool",
	["Value"] = true
})

Sew.CreateService({["Name"] = "SwordService"})
local SwordService = Sew.GetService("SwordService")

Sew.CreateController({
	["Name"] = "SwordController",
	["ParentService"] = SwordService,
	["Invoke"] = function(args)
		print(args)
		Bool.Value = args
	end)
})

local args = false

Sew.GetController("SwordController", "SwordService"):InvokeServer(args)

print(Bool.Value)
