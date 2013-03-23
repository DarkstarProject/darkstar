-----------------------------------------
-- Spell: Zephyr Mantle
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	duration = 300; -- 5 Minutes

	if(target:addStatusEffect(EFFECT_BLINK, 4, 0, duration)) then
		spell:setMsg(230);
	else
		spell:setMsg(75);
	end

	return EFFECT_BLINK;
end;