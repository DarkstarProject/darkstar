-----------------------------------------
-- Spell: Utsusemi: Ni
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	effect = target:getStatusEffect(EFFECT_COPY_IMAGE);
	if (effect == nil) then
		if caster:getMainJob() == 13 then
			target:addStatusEffectEx(EFFECT_COPY_IMAGE,EFFECT_COPY_IMAGE_4,4,0,900);
			target:setMod(MOD_UTSUSEMI, 4);
			spell:setMsg(230);
		else
			target:addStatusEffectEx(EFFECT_COPY_IMAGE,EFFECT_COPY_IMAGE_3,3,0,900);
			target:setMod(MOD_UTSUSEMI, 3);
			spell:setMsg(230);
		end
	elseif caster:getMainJob() == 13 then
		if (effect:getPower() <= 4) then
			spell:setMsg(230);
			effect:setPower(4);
			effect:setIcon(EFFECT_COPY_IMAGE_4);
			effect:resetStartTime();
			target:setMod(MOD_UTSUSEMI, 4);
		else
			spell:setMsg(75);
		end
	else
		if (effect:getPower() <= 3) then
			spell:setMsg(230);
			effect:setPower(3);
			effect:setIcon(EFFECT_COPY_IMAGE_3);
			effect:resetStartTime();
			target:setMod(MOD_UTSUSEMI, 3);
		else
			spell:setMsg(75);
		end
	end

	return EFFECT_COPY_IMAGE;
end;