-----------------------------------------
-- Spell: Protectra IV
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	local power = 120;
	local duration = 1800;

    duration = calculateDurationForLvl(duration, 63, target:getMainLvl());

    local typeEffect = EFFECT_PROTECT;
    if (target:addStatusEffect(typeEffect, power, 0, duration)) then
        spell:setMsg(230);
    else
        spell:setMsg(75); -- no effect
    end

    return typeEffect;
end;
