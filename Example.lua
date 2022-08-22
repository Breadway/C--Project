local Sew = loadstring(game.ReplicatedStorage.Packages.Sew)
local Vars = Sew.Intvars() or Sew.Boolvars() or Sew.Brickvars() or Sew.CFramevars() or Sew.Colorvars() or Sew.Objectvars() or Sew.Numbervars() or Sew.Rayvars() or Sew.Vector3vars() or Sew.Stringvars()
local getVars = Sew.GetVars()

Sew.new({
	["Type"] = "Bool",
	["Name"] = "Bool",
	["Value"] = true
})

print(GetVars.Bool.Value)
