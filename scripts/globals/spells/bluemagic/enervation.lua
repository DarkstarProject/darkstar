---------------------------------------------
--  Enervation
--------------------------------------------- 
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT) - target:getStat(MOD_INT),BLUE_SKILL,1.0);

if(damage > 0 and resist > 0) then
	local typeEffect = EFFECT_DEFENSE_DOWN;
		target:delStatusEffect(typeEffect);
		target:addStatusEffect(typeEffect,10,0,getBlueEffectDuration(caster,resist,typeEffect));
	end
	
if(damage > 0 and resist > 0) then	
	local typeEffect = EFFECT_MAGIC_DEF_DOWN;
		target:delStatusEffect(typeEffect);
		target:addStatusEffect(typeEffect,8,0,getBlueEffectDuration(caster,resist,typeEffect));
	end

	return EFFECT_DEFENSE_DOWN;

end;