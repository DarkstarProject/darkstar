-----------------------------------------
-- Spell: Kurayami:Ichi
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

	-- Base Stats
	local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
	--Duration Calculation
	local duration = 180 * applyResistance(caster,spell,target,dINT,NINJUTSU_SKILL,0);
	--Kurayami base power is 20 and is not affected by resistaces.
	local power = 20;

	--Calculates resist chance from Reist Blind
	if (math.random(0,100) >= target:getMod(MOD_BLINDRES)) then
		if (duration >= 80) then

			if (target:addStatusEffect(EFFECT_BLINDNESS,power,0,duration)) then
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
	return EFFECT_BLINDNESS;
end;
