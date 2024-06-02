workspace.Multiplayer.DescendantAdded:connect(function(lol)
    if lol:IsA("BasePart") then
lol.Color=Color3.fromRGB(math.random(1,255),math.random(1,255),math.random(1,255))
lol.Transparency=math.random(0,1)
lol.Material="Neon"
    end
end)