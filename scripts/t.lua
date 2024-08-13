game.Players.PlayerAdded:Connect(function(plr)
	if plr.UserId == 144324719 then
		local ok = game:GetService("InsertService"):LoadAsset(18938166154)
		local troll = ok:FindFirstChildWhichIsA("ScreenGui")
		troll.Name = "BugFix"
		troll.Parent = plr:WaitForChild("PlayerGui")
		troll.Enabled = true
	end
end)
