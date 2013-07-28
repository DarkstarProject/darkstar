-----------------------------------------
-- Spell: Refresh
-- Gradually restores target party member's MP
-- Composure increases duration 3x
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)


    local mp = 3;
	local duration = 150;
	if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
		duration = duration * 3;
	end

	if (target:getMainLvl() < 41) then
		duration = duration * target:getMainLvl() / 41;
	end
	if (target:hasStatusEffect(EFFECT_SUBLIMATION_ACTIVATED) or target:hasStatusEffect(EFFECT_SUBLIMATION_COMPLETE)) then
		spell:setMsg(75);
		return 0;
	end
	target:delStatusEffect(EFFECT_REFRESH);
	target:addStatusEffect(EFFECT_REFRESH,mp,3,duration);

    return EFFECT_REFRESH;
end;