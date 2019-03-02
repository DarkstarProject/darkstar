-------------------------------------------------
--  TRUST: Excenmille
--  Magic: Flash, Cure I - IV
--  JA: Sentinel
--  WS: Double Thrust, Leg Sweep, Penta Thrust   
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onMobSpawn(mob)
    local weaponskill = 0
	local cureCooldown = 18
	local debuffCooldown = 10
	local sentinelCooldown = 300
	local master = mob:getMaster()
	local excenmille = mob:getID()
	mob:setLocalVar("cureTime",0)
	mob:setLocalVar("debuffTime",0)
	mob:setLocalVar("buffTime",0)
	mob:setLocalVar("sentinelTime",0)
	mob:setLocalVar("flashTime",0)

	mob:addListener("TRUST_COMBAT_TICK", "TRUST_PROVOKE_TICK" .. excenmille, function(mob, player, target)
	    local battletime = os.time()
		local sentinelTime = mob:getLocalVar("sentinelTime")
		if (battletime > sentinelTime + sentinelCooldown) then
			mob:useJobAbility(32, mob)
			mob:setLocalVar("sentinelTime",battletime)
		end
	end)

	mob:addListener("TRUST_COMBAT_TICK", "EXCENMILLE_DEBUFF_TICK" .. excenmille, function(mob, player, target)
	    local battletime = os.time()
		local debuffTime = mob:getLocalVar("debuffTime")

		if (battletime > debuffTime + debuffCooldown) then
		    local spell = doDebuff(mob, target)
			if (spell > 0 ) then
		        mob:castSpell(spell, target)
			end
			mob:setLocalVar("debuffTime",battletime)
		end
	end)

	mob:addListener("TRUST_COMBAT_TICK", "EXCENMILLE_CURE_TICK" .. excenmille, function(mob, player, target)
	    local battletime = os.time()
		local cureTime = mob:getLocalVar("cureTime")

		if (battletime > cureTime + cureCooldown) then
		    local party = player:getParty()
            for _,member in ipairs(party) do
                if (member:getHPP() <= 75) then
					local spell = doCure(mob)
					if (spell > 0) then
                        mob:castSpell(spell, member)
					    mob:setLocalVar("cureTime",battletime)
                        break
					end
			    end
			end
			mob:setLocalVar("cureTime",battletime - 4)  -- If no member has low HP change global check to 8 seconds
		end
	end)

	mob:addListener("TRUST_COMBAT_TICK", "EXCENMILLE_COMBAT_TICK" .. excenmille, function(mob, target)
	    if (mob:getTP() > 1000) then
		    weaponskill = doExcenmilleWeaponskill(mob)
			mob:useMobAbility(weaponskill)
		end
	end)

end

function doExcenmilleWeaponskill(mob)
    local wsList = {{49,116}, {40,115}, {1,112}}
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

function doDebuff(mob, target)
	local flashCooldown = 120
    local battletime = os.time()
	local flashTime = mob:getLocalVar("flashTime")
	local mp = mob:getMP()
	local lvl = mob:getMainLvl()
	local debuff = 0

	if ((battletime > flashTime + flashCooldown) and not target:hasStatusEffect(dsp.effect.FLASH) and lvl >= 37 and mp >= 25) then
		mob:setLocalVar("flashTime",battletime)
	    debuff = 112
    end

    return debuff
end

function doCure(mob)
    local cureList = {{55,88,4}, {30,46,3}, {17,24,2}, {5,8,1}}
    local mp = mob:getMP()
	local lvl = mob:getMainLvl()
	local cure = 0


	for i = 1, #cureList do
		if (lvl >= cureList[i][1] and mp >= cureList[i][2]) then
			cure = cureList[i][3]
			break
		end
	end

	return cure
end