local function draggablev2(floght)
    floght.Active = true
    floght.Draggable = true
end

    for _, child in ipairs(game.Players:GetDescendants()) do
        if child:IsA("GuiObject") then
            draggablev2(child)
        end
    end