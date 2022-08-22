local Sew = {}
local ServicesFolder = game.ReplicatedStorage.Packages.Sew.Services
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

local Services = {}
local Controllers = {}
local Stringvars = {}
local Intvars = {}
local Vector3vars = {}
local Rayvars = {}
local Numbervars = {}
local Objectvars = {}
local Color3vars = {}
local CFramevars = {}
local Brickvars = {}
local Boolvars = {}
local Allvars = {}

function Sew.GetVar(Var)
	local var = AllVars[Var]
	return var
end

function Sew.GetAllControllers()
	return Controllers
end

function Sew.GetAllServices()
	return Services
end

function Sew.GetVars()
	return Allvars
end

function Sew.Intvars()
	return Intvars
end

function Sew.Boolvars()
	return Boolvars
end

function Sew.Brickvars()
	return Brickvars
end

function Sew.CFramevars()
	return CFramevars
end

function Sew.Colorvars()
	return Color3vars
end

function Sew.Objectvars()
	return Objectvars
end

function Sew.Numbervars()
	return Numbervars
end

function Sew.Rayvars()
	return Rayvars
end

function Sew.Vector3vars()
	return Vector3vars
end

function Sew.Stringvars()
	return Stringvars
end

function Sew.CreateVar(argstable)
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

	local Var = Instance.new(argstable["Type"].. "Value")
	Var.Name = argstable["Name"]
	Var.Value = argstable["Value"]
	print("Successfully Made ".. argstable["Name"] .. " Value Of Type: " .. argstable["Type"])
	table.insert(Allvars, Var)
	if Var.ClassName == "BoolValue" then
		table.insert(Boolvars, Var)
	elseif Var.ClassName == "IntValue" then
		table.insert(Intvars, Var)
	elseif Var.ClassName == "BrickColorValue" then
		table.insert(Brickvars, Var)
	elseif Var.ClassName == "CFrameValue" then
		table.insert(CFramevars, Var)
	elseif Var.ClassName == "Color3Value" then
		table.insert(Color3vars, Var)
	elseif Var.ClassName == "ObjectVar" then
		table.insert(Objectvars, Var)
	elseif Var.ClassName == "NumberValue" then
		table.insert(Numbervars, Var)
	elseif Var.ClassName == "RayValue" then
		table.insert(Numbervars, Var)
	elseif Var.ClassName == "Vector3Value" then
		table.insert(Vector3vars, Var)
	elseif Var.ClassName == "StringValue" then
		table.insert(Stringvars, Var)
	end
	return Int
end

function Sew.CreateService(argstable)
	local Service = Instance.new("Folder")
	Service.Name = argstable["Name"]
	table.insert(Services, Service)
	return Service
end

function Sew.GetService(Name)
	local service = Services[Name]
	return service
end

function Sew.CreateController(argstable)
	local Controller = Instance.new("RemoteFunction")
	local args1, Invoke = nil or argstable["Invoke"]
	Controller.Name = argstable["Name"]
	table.insert(Controllers, Controller)
	table.insert(Services[argstable["ParentService"]], Controller)
	Controller.OnServerInvoke:Connect(function(args)
		pcall(function(args)
			args1 = args
			pcall(Invoke, args1)
		end)
	end)
	return Controller
end

function Sew.GetController(Name, ParentService)
	local Controller = Services[ParentService][Name]
	return Controller
end

return Sew
