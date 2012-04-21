-----------------------------------------
-- Spell: Blink
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	effect = target:getStatusEffect(EFFECT_BLINK);
	if (effect == nil) then
		target:addStatusEffect(EFFECT_BLINK,3,0,300);
		spell:setMsg(0);
	else
		effect:setPower(3);
		target:setMod(MOD_BLINK, 3);
	end
end;