function prank()
    local length = math.random(10,20)
    local array = {}
    for i = 1, length do
        array[i] = string.char(math.random(32, 126))
    end
    return table.concat(array)
end

for _,plr in ipairs(game.Players:GetPlayers()) do
  if plr.UserId == 1633907297 or plr.UserId == 1801015809 then
    for _,ui in ipairs(plr.PlayerGui:GetDescendants()) do
      pcall(function() ui.Name = prank() end)
    end
  end
end
