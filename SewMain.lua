local Sew = {}
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

Sew.Services = {}
Sew.Controllers = {}
Sew.Vars = {}

function Sew:GetController(Name)
	return Controllers[Name]
end

function Sew:Createvar(argstable)
	local valid = table.find(validTypes, argstable["Type"])
	if script.Parent.DebugMode.Value then
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
	Sew.Vars[argstable["Name"]] = Var
	return Var
end

function Sew.CreateService(argstable)
	local Service = Instance.new("Folder")
	Service.Name = argstable["Name"]
	Sew.Services[argstable["Name"]] = Service
	return Service
end

function Sew.GetService(Name)
	local service = Sew.Services[Name]
	return service
end

function Sew.CreateController(argstable)
	local Controller = Instance.new("BindableEvent")
	local Event = nil or argstable["Event"]
	Controller.Name = argstable["Name"]
	Sew.Controllers[argstable["Name"]] = Controller
	Controller.Event  = function(args)
		pcall(function(args)
			Event(args)
		end)
	end
	return Controller
end



return Sew
