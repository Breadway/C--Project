local remote = game.ReplicatedStorage.Packages.SecureRemote
local x = math.random(1/9) .. math.random(1/9) .. math.random(1/9) .. math.random(1/9) .. math.random(1/9)
local key = math.random(1/99999)

repeat
  x = math.random(1/9) .. math.random(1/9) .. math.random(1/9) .. math.random(1/9) .. math.random(1/9)
until x == key
local args = runcode(function()
    print("Hello, World!")
end)

remote:FireServer(x)
game.ReplicatedStorage.Value.Value = x
