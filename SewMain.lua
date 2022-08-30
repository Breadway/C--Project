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

Sew.Services = Instance.new("Folder")
Sew.Vars = Instance.new("Folder")

function Sew:GetController(Name)
	return Controllers[Name]
end

function Sew:Createvar(argstable)
	pcall(function(argstable)
		local valid = table.find(validTypes, argstable["Type"])
		if script.Parent.DebugMode.Value then
			print(argstable)
		end

		if not valid then
			warn(argstable["Type"] .. " Is Not A Valid Value Type")
			return
		end

		local Var = Instance.new(argstable["Type"].. "Value")
		Var.Name = argstable["Name"]
		Var.Value = argstable["Value"]
		print("Successfully Made ".. argstable["Name"] .. " Value Of Type: " .. argstable["Type"])
		Var.Parent = Sew.Vars
		return Var
	end)
end

function Sew.CreateService(Name)
	local Service = Instance.new("Folder")
	Service.Name = Name
	Service.Parent = Sew.Services
	return Service
end

function Sew.CreateController(argstable)
	local Controller = Instance.new("BindableEvent")
	local Event = nil or argstable["Event"]
	Controller.Name = argstable["Name"]
	Controller.Parent = Sew.Services[argstable["ParentService"]]
	Controller.Event:Connect(function(args)
		pcall(function(args)
			Event(args)
		end)
	end)
	return Controller
end



return Sew
