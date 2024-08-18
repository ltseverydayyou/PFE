--[[
Stop users loading requested removed maps here

-- the deadline is used so that a map can be loaded before a certain time

[MapID] = {deadline = unixTimestap or 0}

https://rechneronline.de/add-time/timestamp.php
]]
return {
  -- shows the stupid popup -- for more the models are replaced with blank ones
[17796545968] = {deadline = 1723142529863},
[17227205654] = {deadline = 1723142529863},
[17227197083] = {deadline = 1723142529863},
[17227193214] = {deadline = 1723142529863},
[17227450050] = {deadline=0};
}
