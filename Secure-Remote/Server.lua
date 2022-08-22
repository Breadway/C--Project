local remote = game.ReplicatedStorage.Packages.SecureRemote
local y = math.random(1/9) .. math.random(1/9) .. math.random(1/9) .. math.random(1/9) .. math.random(1/9)
local key = math.random(1/99999)

repeat
  y = math.random(1/9) .. math.random(1/9) .. math.random(1/9) .. math.random(1/9) .. math.random(1/9)
until y == key

remote.OnServerEvent:Connect(function(x, args)
    local z = x*y
    if z == game.RepllicatedStorage.Value.Value * y then
        --Event
      runcode(function()
          args
      end)
    end
end)
