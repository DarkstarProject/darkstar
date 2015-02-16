-----------------------------------------
-- Spell: Mortal Ray
-----------------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)


    local duration = 30;
	local bonus = AffinityBonus(caster, spell:getElement());
	local pINT = caster:getStat(MOD_INT);
	local mINT = target:getStat(MOD_INT);
	local dINT = (pINT - mINT);
	local resm = applyResistance(caster,spell,target,dINT,BLUE_SKILL,bonus);
	if(resm < 1.0425) then
		spell:setMsg(85);--resist message
		return EFFECT_DOOM;
	end

	duration = duration * resm;

	if(target:addStatusEffect(EFFECT_DOOM,10,3,duration)) then
		spell:setMsg(237);
	else
		spell:setMsg(75);
	end

	return EFFECT_DOOM;
end;
