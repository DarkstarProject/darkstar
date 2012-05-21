-----------------------------------------
-- Spell: Blink
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	effect = target:getStatusEffect(EFFECT_BLINK);
	utsuseffect = target:getStatusEffect(EFFECT_COPY_IMAGE);
	if(utsuseffect~=nil)then
		spell:setMsg(75);
	elseif (effect == nil) then
		duration = 300;
		if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
			duration = duration * 3;
		end
		target:addStatusEffect(EFFECT_BLINK,3,0,duration);
		spell:setMsg(230);
		return EFFECT_BLINK;
	else
		effect:setPower(3);
		target:setMod(MOD_BLINK, 3);
		spell:setMsg(230);
		return EFFECT_BLINK;
	end
end;