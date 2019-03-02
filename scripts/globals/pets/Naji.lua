-------------------------------------------------
--  TRUST: Naji
--  Magic: None
--  JA: Provoke
--  WS: Burning Blade, Red Lotus Blade, Vorpal Blade    
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onMobSpawn(mob)
    local weaponskill = 0
	local naji = mob:getID()
	mob:setLocalVar("provokeTime",0)

	mob:addListener("TRUST_COMBAT_TICK", "NAJI_COMBAT_TICK" .. naji, function(mob)
	    if (mob:getTP() > 1000) then
		    local targ = mob:getTarget()
		    weaponskill = doWeaponskill(mob)
			mob:useMobAbility(weaponskill)
		end
	end)

	mob:addListener("TRUST_COMBAT_TICK", "TRUST_PROVOKE_TICK" .. naji, function(mob, player, target)
	    local battletime = os.time()
		local provoke = mob:getLocalVar("provokeTime")
		if ((battletime > provoke + 30) and target:isAlive() and target:getTarget() ~= mob) then  -- Only provoke when the mob turns attention to player
			mob:useJobAbility(19, target)
			mob:setLocalVar("provokeTime",battletime)
		end
	end)
end

function doWeaponskill(mob)
    local wsList = {{62,40}, {17,34}, {1,33}}
    local newWsList = {}
	local maxws = 3 -- Maximum number of weaponskills to choose from randomly
	local wscount = 0
	local lvl = mob:getMainLvl()
	local finalWS = 0

	for i = 1, #wsList do
		if (lvl >= wsList[i][1]) then
			table.insert(newWsList, wscount + 1, wsList[i][2])
			wscount = wscount + 1
			if (wscount >= maxws) then
				break
			end
		end
	end

	finalWS = newWsList[math.random(1,#newWsList)]
	return finalWS
end