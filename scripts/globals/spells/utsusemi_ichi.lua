-----------------------------------------
-- Spell: Utsusemi: Ichi
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	target:delStatusEffect(EFFECT_BLINK);
	effect = target:getStatusEffect(EFFECT_COPY_IMAGE);
	if (effect == nil) then
		target:addStatusEffectEx(EFFECT_COPY_IMAGE,EFFECT_COPY_IMAGE_3,3,0,300);
		target:setMod(MOD_UTSUSEMI, 3);
		spell:setMsg(0);
	elseif (effect:getPower() <= 3) then
		spell:setMsg(0);
		effect:setPower(3);
		effect:setIcon(EFFECT_COPY_IMAGE_3);
		effect:resetStartTime();
		target:setMod(MOD_UTSUSEMI, 3);
	else
		spell:setMsg(75);
	end
end;