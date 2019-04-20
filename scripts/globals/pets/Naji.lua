-------------------------------------------------
--  TRUST: Naji
--  Magic: None
--  JA: Provoke
--  WS: Burning Blade[33], Red Lotus Blade[34], Vorpal Blade[40]    
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/ability")
require("scripts/globals/weaponskillids")
require("scripts/globals/pets/TrustUtils")


najiws = 
{
	dsp.ws.VORPAL_BLADE,
	dsp.ws.RED_LOTUS_BLADE,
	dsp.ws.BURNING_BLADE, 
}


function onMobSpawn(this)
end

function onMobEngaged(entity, target)
	createWSSCListener(target, "Naji")
end

function onMobFight(this, target)
	local mobTarget = target:getTarget()
	if(mobTarget ~= nil) then 
		if(mobTarget:getName() ~= "Naji") then
			provokeTarget(this, target)
		end
	end

	if(this:getTP() >= 1000) then 
		if(randomWSCheck(this, najiws)) then 
			return 
		else
			skillchainPotential(this, target, najiws);
		end
	end

end

function provokeTarget(this, target)
	if(not this:hasRecast(2, dsp.ja.PROVOKE)) then
		this:useJobAbility(dsp.ja.PROVOKE, target)
		this:addRecast(2, dsp.ja.PROVOKE, 30)
	end
end
