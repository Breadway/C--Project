local Sew = game.ReplicatedStorage[script.Parent.player.Value].Values or {}
local validTypes = {
	"Bool",
	"BrickColor",
	"CFrame",
	"Color3",
	"Object",
	"Number",
	"Ray",
	"Vector3",
	"Int",
	"String"
}
function Sew.Intvars()
	return var.Int
end

function Sew.Boolvars()
	return var.Bool
end

function Sew.Brickvars()
	return var.BrickColor
end

function Sew.CFramevars()
	return var.CFrame
end

function Sew.Colorvars()
	return var.Color3
end

function Sew.Objectvars()
	return var.Object
end

function Sew.Numbervars()
	return var.Number
end

function Sew.Rayvars()
	return var.Ray
end

function Sew.Vector3vars()
	return var.Vector3
end

function Sew.Stringvars()
	return var.String
end

function Sew.new(argstable)
	local valid = table.find(validTypes, argstable["Type"])
	if script.DebugMode.Value then
		print(argstable)
	end
	--[[if argstable["Type"] ~= "Bool" then valid = false elseif argstable["Type"] == "Bool" then valid = true end
	if argstable["Type"] ~= "BrickColor" then valid = false elseif argstable["Type"] == "BrickColor" then valid = true end
	if argstable["Type"] ~= "CFrame" then valid = false elseif argstable["Type"] == "CFrame" then valid = true end
	if argstable["Type"] ~= "Color3" then valid = false elseif argstable["Type"] == "Color3" then valid = true end
	if argstable["Type"] ~= "Object" then valid = false elseif argstable["Type"] == "Object" then valid = true end
	if argstable["Type"] ~= "Number" then valid = false elseif argstable["Type"] == "Number" then valid = true end
	if argstable["Type"] ~= "Ray" then valid = false elseif argstable["Type"] == "Ray" then valid = true end
	if argstable["Type"] ~= "Vector3" then valid = false elseif argstable["Type"] == "Vector3" then valid = true end
	if argstable["Type"] ~= "Int" then valid = false elseif argstable["Type"] == "Int" then valid = true end
	if argstable["Type"] ~= "String" then valid = false elseif argstable["Type"] == "String" then valid = true end
	]]--
	if not valid then
		warn(argstable["Type"] .. " Is Not A Valid Value Type")
		return
	end

	local Int = Instance.new(argstable["Type"].. "Value")
	Int.Parent = var[argstable["Type"]]
	Int.Name = argstable["Name"]
	Int.Value = argstable["Value"]
	print("Successfully Made ".. argstable["Name"] .. " Value Of Type: " .. argstable["Type"])
	return Int.Value
end

return varnew
