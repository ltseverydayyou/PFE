function test()
    for _,v in ipairs(game.Players:GetPlayers()) do
        print(v.Name)
    end
end
    
return function() test() end