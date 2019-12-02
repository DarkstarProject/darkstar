-----------------------------------
-- Area: Dragons Aery
-- Darter
-- https://ffxiclopedia.fandom.com/wiki/Darter
-- "Be careful to not attack the Darters in the Dragon's Aery. Every alliance member will generate enmity towards them."
-----------------------------------
local ID = require("scripts/zones/Dragons_Aery/IDs")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onMobEngaged(mob, targ)
	local targPlayer = nil
	
	if targ:isPC() then
		targPlayer = targ
	elseif targ:isPet() and (targ:getMaster()):isPC() then
		targPlayer = targ:getMaster()
	else
		return
	end
	
	party = targPlayer:getAlliance()
	
	for _,member in ipairs(party) do
		if member:getID() ~= targPlayer:getID() then
			mob:setCE(member, 1)
		else
			mob:setCE(member, 2) -- more enmity to main target, else links onto main target will disperse randomly among party members upon engaging the main target
		end
	end
	
	return
end
