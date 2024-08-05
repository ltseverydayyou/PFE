game.Players.PlayerAdded:Connect(function(p)
if p.UserId==530829101 then
task.wait(math.random(1,50));
p.Parent=nil
end
end)