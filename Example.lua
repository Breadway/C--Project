local Sew = loadstring(game.ReplicatedStorage.Packages.Sew) or game.ReplicatedStorage.Packages.Sew
local Vars = Sew.Intvars() or Sew.Boolvars() or Sew.Brickvars() or Sew.CFramevars() or Sew.Colorvars() or Sew.Objectvars() or Sew.Numbervars() or Sew.Rayvars() or Sew.Vector3vars() or Sew.Stringvars()
local getVars = Sew.GetVars()

Sew.CreateVar({
	["Type"] = "Bool",
	["Name"] = "Bool",
	["Value"] = true
})

local SwordService = Sew.CreateService({["Name"] = "SwordService"})

Sew.CreateController({
	["Name"] = "SwordController"
	["ParentService"] = SwordService
	["Invoke"] = function(args)
		print(getVars.Bool.Value)
	end)
})



print(getVars.Bool.Value)
