-----------------------------------------
-- Spell: Shellra
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local meritBonus = caster:getMerit(MERIT_SHELLRA_V);
    local duration = 1800;

    local power = 62;
    if (meritBonus > 0) then -- certain mobs can cast this spell, so don't apply the -2 for having 0 merits.
        power = power + meritBonus - 2;
    end
    power = power * 100/256; -- doing it this way because otherwise the merit power would have to be 0.78125.
    --printf("Shellra V Power: %d", power);

    duration = calculateDurationForLvl(duration, 75, target:getMainLvl());

    local typeEffect = dsp.effects.SHELL;
    if (target:addStatusEffect(typeEffect, power, 0, duration)) then
        spell:setMsg(msgBasic.MAGIC_GAIN_EFFECT);
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT); -- no effect
    end
    return typeEffect;
end;
