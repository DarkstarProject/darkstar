-----------------------------------
--  Trust: Template
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/trusts")
require("scripts/globals/msg")

-----------------------------------------------------------------------------------
--  Spawn/Despawn Functions
-----------------------------------------------------------------------------------
function onTrustSpawn(trust)
	return 0
end

function onTrustDeath(trust)
	return 0
end

function onTrustDespawn(trust)
	return 0
end


-----------------------------------------------------------------------------------
--  Battle Functions
-----------------------------------------------------------------------------------
function onTrustEngaged(trust,target)
	return 0
end

function onTrustFight(trust,target)
	return 0
end

function onTrustCast(trust)
	return 0
end

function onTrustDisengage(trust,target)
	return 0
end


-----------------------------------------------------------------------------------
--  Action Check Functions
-----------------------------------------------------------------------------------
function onTrustSpellCheck(target, trust, spell)
	return 0
end

function onTrustSkillCheck(target, trust, skill)
	return 0
end;

function onTrustWeaponSkillCheck(target, trust, wskill)
	return 0
end