for i=1,5 do
print("silly")
end
function doesitprint()
print("did it print?")
end
return function() doesitprint() end
