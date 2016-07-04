-----------------------------------------
-- Spell: Hyoton: San
-- Deals ice damage to an enemy and lowers its resistance against fire.
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
    --doNinjutsuNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
    local duration = 15 + caster:getMerit(MERIT_HYOTON_EFFECT) -- T1 bonus debuff duration
    local bonusAcc = 0;
    local bonusMab = caster:getMerit(MERIT_HYOTON_EFFECT); -- T1 mag atk

    if(caster:getMerit(MERIT_HYOTON_SAN) ~= 0) then -- T2 mag atk/mag acc, don't want to give a penalty to entities that can cast this without merits
        bonusMab = bonusMab + caster:getMerit(MERIT_HYOTON_SAN) - 5; -- merit gives 5 power but no bonus with one invest, thus subtract 5
        bonusAcc = bonusAcc + caster:getMerit(MERIT_HYOTON_SAN) - 5;
    end

    local dmg = doNinjutsuNuke(134,1.5,caster,spell,target,false,bonusAcc,bonusMab);
    handleNinjutsuDebuff(caster,target,spell,30,duration,MOD_FIRERES);

    return dmg;
end;