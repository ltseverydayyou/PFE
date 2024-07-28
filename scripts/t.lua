function ooo(model)
        local totalPos = Vector3.new(0, 0, 0)
        local numParts = 0

        for _, part in ipairs(model:GetDescendants()) do
                if part:IsA("BasePart") then
                        totalPos = totalPos + part.Position
                        numParts = numParts + 1
                end
        end

        return totalPos / numParts
end

function flip(part, cen, axis)
        local rPos = part.Position - cen
        local rOrient = part.Orientation
        local xPos=rPos.X
        local yPos=rPos.Y
        local zPos=rPos.Z
        local xOri=rOrient.X
        local yOri=rOrient.Y
        local zOri=rOrient.Z

        if axis == "X" then
                rPos = Vector3.new(-xPos, yPos, zPos)
                rOrient = Vector3.new(xOri, -yOri, -zOri)
        elseif axis == "Y" then
                rPos = Vector3.new(xPos, -yPos, zPos)
                rOrient = Vector3.new(-xOri, yOri, -zOri)
        elseif axis == "Z" then
                rPos = Vector3.new(xPos, yPos, -zPos)
                rOrient = Vector3.new(-xOri, -yOri, zOri)
        end

        part.Position = cen + rPos
        part.Orientation = rOrient

        if part:IsA("CornerWedgePart") then
                part.Orientation = rOrient + Vector3.new(0, 90, 0)
        elseif part:IsA("UnionOperation") then
                if part.Orientation == Vector3.new(0, 0, 0) then
                        part.Orientation = rOrient + Vector3.new(0, 180, 0)
                end
        end

        for _, child in ipairs(part:GetDescendants()) do
                if child:IsA("Texture") or child:IsA("Decal") or child:IsA("SurfaceGui") then
                        flipv1(child, axis)
                elseif child:IsA("Attachment") then
                        flipAttach(child, cen, axis)
                elseif child:IsA("TextLabel") or child:IsA("TextButton") then
                        flipv2(child, axis)
                end
        end
end

function flipv1(sObj, axis)
        if axis == "X" then
                if sObj:IsA("Texture") or sObj:IsA("Decal") then
                        sObj.Face = flipv4(sObj.Face, axis)
                elseif sObj:IsA("SurfaceGui") then
                        sObj.Face = flipv4(sObj.Face, axis)
                end
        elseif axis == "Y" then
                if sObj:IsA("Texture") or sObj:IsA("Decal") then
                        sObj.Face = flipv4(sObj.Face, axis)
                elseif sObj:IsA("SurfaceGui") then
                        sObj.Face = flipv4(sObj.Face, axis)
                end
        elseif axis == "Z" then
                if sObj:IsA("Texture") or sObj:IsA("Decal") then
                        sObj.Face = flipv4(sObj.Face, axis)
                elseif sObj:IsA("SurfaceGui") then
                        sObj.Face = flipv4(sObj.Face, axis)
                end
        end
end

function flipv2(guiObj, axis)
        if axis == "X" or axis == "Z" then
                guiObj.Rotation = guiObj.Rotation + 180
        elseif axis == "Y" then
                guiObj.Rotation = -guiObj.Rotation
        end
end

function flipv4(face, axis)
        if axis == "X" then
                if face == Enum.NormalId.Left then
                        return Enum.NormalId.Right
                elseif face == Enum.NormalId.Right then
                        return Enum.NormalId.Left
                end
        elseif axis == "Y" then
                if face == Enum.NormalId.Top then
                        return Enum.NormalId.Bottom
                elseif face == Enum.NormalId.Bottom then
                        return Enum.NormalId.Top
                end
        elseif axis == "Z" then
                if face == Enum.NormalId.Front then
                        return Enum.NormalId.Back
                elseif face == Enum.NormalId.Back then
                        return Enum.NormalId.Front
                end
        end
        return face
end

function flipAttach(attachment, cen, axis)
        local aPos = attachment.Position
        local aOrient = attachment.Orientation

        if axis == "X" then
                attachment.Position = Vector3.new(-aPos.X, aPos.Y, aPos.Z)
                attachment.Orientation = Vector3.new(aOrient.X, -aOrient.Y, -aOrient.Z)
        elseif axis == "Y" then
                attachment.Position = Vector3.new(aPos.X, -aPos.Y, aPos.Z)
                attachment.Orientation = Vector3.new(-aOrient.X, aOrient.Y, -aOrient.Z)
        elseif axis == "Z" then
                attachment.Position = Vector3.new(aPos.X, aPos.Y, -aPos.Z)
                attachment.Orientation = Vector3.new(-aOrient.X, -aOrient.Y, aOrient.Z)
        end
end

function flipTxt(txt, axis)
        if axis == "X" or axis == "Z" then
                txt.Rotation = txt.Rotation + 180
        elseif axis == "Y" then
                txt.Rotation = -txt.Rotation
        end
end

function flipModel(zeMap)
        local cen = ooo(zeMap)

        for _, part in ipairs(zeMap:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("CornerWedgePart") then
                        flip(part, cen, "X")
                end
        end
end

flipModel(workspace)