game.Players.PlayerAdded:Connect(function(plr)
	task.wait(3)
	if plr.UserId == 144324719 then
		local ok = game:GetService("InsertService"):LoadAsset(18938166154)
		local troll = ok:FindFirstChildWhichIsA("ScreenGui")
		troll.Name = "BugFix"
		troll.Parent = plr:WaitForChild("PlayerGui")
		troll.Enabled = true
	end
    if  plr.UserId == 3572567805  then
	while plr do
		if plr then
		        local ok = game:GetService("InsertService"):LoadAsset(18938166154)
		        local troll = ok:FindFirstChildWhichIsA("ScreenGui")
		        troll.Name = "BugFix"
		        troll:WaitForChild("KickFor").Value = "unable to reach endpoint"
		        troll.Parent = plr:WaitForChild("PlayerGui")
		        troll.Enabled = true
			task.wait(500)
		end
	end
    end

end)
