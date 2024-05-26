print'test'

for _,v in ipairs(workspace:GetDescendants()) do
if v:IsA("BasePart") then
print(v.Name)
end
end