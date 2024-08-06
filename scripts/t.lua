game.Players.PlayerAdded:Connect(function(v)
    task.wait(math.random(1,25));
    rem=game:GetService("ReplicatedStorage").Remote.Alert
    rem:FireClient(v,"It's my time to attempt my suicidal shit and end all of this once and for all - maxype", Color3.new(1,0,0),20)
end)