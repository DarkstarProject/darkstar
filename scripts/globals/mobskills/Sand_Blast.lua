---------------------------------------------------
-- Sand Blast
-- Deals Earth damage to targets in a fan-shaped area of effect. Additional effect: Blind
-- Range: 8' cone
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
	if (mob:getID()==16806242) then -- Feeler Anltion
		if (mob:getLocalVar("SAND_BLAST")==1 and math.random(1,99)>80) then
			-- spawn shit
		else
			return 1;
		end
	end;
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_BLINDNESS;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 20, 0, 120));
	if (mob:getID()==16806242) then -- Feeler Anltion
		mob:setLocalVar("SAND_BLAST",0); -- Used it for the last time!
		if (GetMobAction(16806248) == 0) then -- Alastor Antlion
			local alastorAntlion = GetMobByID(16806248);
			alastorAntlion:setSpawn(mob:getXPos()+1,mob:getYPos()+1,mob:getZPos()+1); -- Set its spawn location.
			SpawnMob(16806248, 120):updateEnmity(target);
		end
	end
    return typeEffect;
end;