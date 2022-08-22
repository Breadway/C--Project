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

	local Int = Instance.new(argstable["Type"].. "Value")
	Int.Name = argstable["Name"]
	Int.Value = argstable["Value"]
	print("Successfully Made ".. argstable["Name"] .. " Value Of Type: " .. argstable["Type"])
	table.insert(Allvars, Int)
	if Int.ClassName == "BoolValue" then
		table.insert(Boolvars, Int)
	elseif Int.ClassName == "IntValue" then
		table.insert(Intvars, Int)
	elseif Int.ClassName == "BrickColorValue" then
		table.insert(Brickvars, Int)
	elseif Int.ClassName == "CFrameValue" then
		table.insert(CFramevars, Int)
	elseif Int.ClassName == "Color3Value" then
		table.insert(Color3vars, Int)
	elseif Int.ClassName == "ObjectValue" then
		table.insert(Objectvars, Int)
	elseif Int.ClassName == "NumberValue" then
		table.insert(Numbervars, Int)
	elseif Int.ClassName == "RayValue" then
		table.insert(Numbervars, Int)
	elseif Int.ClassName == "Vector3Value" then
		table.insert(Vector3vars, Int)
	elseif Int.ClassName == "StringValue" then
		table.insert(Stringvars, Int)
	end
	return Int.Value
end

function Sew.CreateService(argstable)
	local Service = Instance.new("Folder")
	Service.Parent = ServicesFolder
	Service.Name = argstable["Name"]
	table.insert(Services, Service)
end

function Sew.GetService(Name)
	local service = Services[Name]
	return service
end

function Sew.CreateController(Name, ParentService, Invoke)
	local Controller = Instance.new("RemoteFunction")
	Controller.Parent = ServicesFolder[ParentService]
	Controller.Name = Name
	table.insert(Controllers, Controller)
	Controller.OnServerInvoke:Connect(function(args)
		pcall(Invoke(args))
	end)
	return Controller
end

function Sew.GetController(Name, ParentService)
	local Controller = ServicesFolder[ParentService][Name]
	return Controller
end

return Sew
