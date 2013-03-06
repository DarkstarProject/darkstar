-----------------------------------------
-- Spell: Hojo:Ni
-- Description: Inflicts Slow on target.
-- Edited from slow.lua
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

	dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
	bonus = AffinityBonus(caster,spell);
	--Power for Hojo is a flat 19.5% reduction
	power = 200;
	--Duration and Resistance calculation
	duration = 300 * applyResistance(caster,spell,target,dINT,NINJUTSU_SKILL,bonus);
	--Calculates the resist chance from Resist Blind trait
	if(math.random(0,100) >= target:getMod(MOD_SLOWRES)) then
		-- Spell succeeds if a 1 or 1/2 resist check is achieved
		if(duration >= 150) then

			if(target:addStatusEffect(EFFECT_SLOW,power,0,duration)) then
				spell:setMsg(236);
			else
				spell:setMsg(75);
			end
		else
			spell:setMsg(85);
		end
	else
		spell:setMsg(284);
	end
	return EFFECT_SLOW;
end;