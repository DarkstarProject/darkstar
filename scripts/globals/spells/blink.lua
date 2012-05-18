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
		duration = 300;
		if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
			duration = duration * 3;
		end
		target:addStatusEffect(EFFECT_BLINK,3,0,duration);
		spell:setMsg(0);
	else
		effect:setPower(3);
		target:setMod(MOD_BLINK, 3);
	end
end;