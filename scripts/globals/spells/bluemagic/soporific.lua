-----------------------------------------
-- Spell: Soporific
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	local duration = 90;
	local typeEffect = EFFECT_SLEEP_II;
	local bonus = AffinityBonus(caster, spell:getElement());
	local pINT = caster:getStat(MOD_INT);
	local mINT = target:getStat(MOD_INT);
	local dINT = (pINT - mINT);
	local resm = applyResistance(caster,spell,target,dINT,BLUE_SKILL,bonus);
	if(resm < 0.5) then
		spell:setMsg(85);--resist message
		return typeEffect;
	end

	duration = duration * resm;


	if(target:hasStatusEffect(typeEffect) == true) then
		spell:setMsg(75);
	else
	target:addStatusEffect(typeEffect,2,0,duration)
		spell:setMsg(236);
	end

	return typeEffect;
end;