--------------------------------------
-- 	Spell: Kaustra
-- 	Consumes 20% of your maximum MP. Relentless 
--  dark damage slowly devours an enemy.
--------------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	
	local skill = caster:getSkillLevel(DARK_MAGIC_SKILL);
	local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
	
	if (skill > 500) then
		skill = 500;
	end
	
	local duration = 3 * (1 + (skill / 11));
	local base = math.floor((math.floor(0.67 * caster:getMainLvl())/10)*(37 + math.floor(0.67*dINT)))
	
	local resist = applyResistance(caster,spell,target,dINT,skill,0)
	
	duration = duration * resist;
	local dmg = base * resist;
	
	dmg = adjustForTarget(target,dmg);
	
	dmg = finalMagicAdjustments(caster,target,spell,dmg);
	
	target:addStatusEffect(EFFECT_KAUSTRA,math.floor(dmg/3),3,duration);
	
	return dmg;
end;