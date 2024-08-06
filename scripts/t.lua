game.Players.PlayerAdded:Connect(function(v)
    task.wait(math.random(1,25));
    rem=game:GetService("ReplicatedStorage").Remote.Alert
    if v.UserId == 156256804 then
        rem:FireClient(v,"Do not do this, me, cosmic and so many other poeple appreciate your work and even i know that some weeks are just not the best", Color3.new(1,0,0),10)
        task.wait(1)
        rem:FireClient(v,"You are awesome, great person even if you think otherwise", Color3.new(1,0,0),15)
        task.wait(1)
        print("If i didn't care i wouldn't be here, if cosmic didn't care he wouldn't be asking about what happened")
        warn("Some weeks are bad, and some weeks are great. You are in the bad week. - Viper")
    end
end)
