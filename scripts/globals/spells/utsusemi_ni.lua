-----------------------------------------
-- Spell: Utsusemi: Ni
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	target:delStatusEffect(EFFECT_BLINK);
	effect = target:getStatusEffect(EFFECT_COPY_IMAGE);
	if (effect == nil) then
		target:addStatusEffectEx(EFFECT_COPY_IMAGE,EFFECT_COPY_IMAGE_4,4,0,300);
		target:setMod(MOD_UTSUSEMI, 4);
		spell:setMsg(0);
	elseif (effect:getPower() <= 4) then
		spell:setMsg(0);
		effect:setPower(4);
		effect:setIcon(EFFECT_COPY_IMAGE_4);
		effect:resetStartTime();
		target:setMod(MOD_UTSUSEMI, 4);
	else
		spell:setMsg(75);
	end
end;