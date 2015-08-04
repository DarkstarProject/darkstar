-----------------------------------------
-- Spell: Protectra V
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
    local meritBonus = caster:getMerit(MERIT_PROTECTRA_V);
    local duration = 1800;
    --Base Power is actually 175, but you have to have at least 1 merit and they're each +5
    
    local power = 170 + meritBonus;
    --printf("Protectra V Power: %d", power);
    
    duration = calculateDurationForLvl(duration, 75, target:getMainLvl());

    local typeEffect = EFFECT_PROTECT;
    if (target:addStatusEffect(typeEffect, power, 0, duration)) then
        spell:setMsg(230);
    else
        spell:setMsg(75); -- no effect
    end

    return typeEffect;
end;
