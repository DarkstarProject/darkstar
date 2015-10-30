-----------------------------------------
-- Spell: Katon: San
-- Deals fire damage to an enemy and lowers its resistance against water.
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
    local duration = 15 + caster:getMerit(MERIT_KATON_EFFECT) -- T1 bonus debuff duration
    local bonusAcc = 0;
    local bonusMab = caster:getMerit(MERIT_KATON_EFFECT) + caster:getMod(MOD_NIN_NUKE_BONUS); -- T1 mag atk + "enhances Ninjustu damage" mod

    if(caster:getMerit(MERIT_KATON_SAN) ~= 0) then -- T2 mag atk/mag acc, don't want to give a penalty to entities that can cast this without merits
        bonusMab = bonusMab + caster:getMerit(MERIT_KATON_SAN) - 5; -- merit gives 5 power but no bonus with one invest, thus subtract 5
        bonusAcc = bonusAcc + caster:getMerit(MERIT_KATON_SAN) - 5;
    end;
    if (caster:isBehind(target,15) and caster:hasStatusEffect(EFFECT_INNIN)) then -- Innin mag atk bonus from behind, guesstimating angle at 15 degrees
        bonusMab = bonusMab + caster:getStatusEffect(EFFECT_INNIN):getPower();
    end

    local dmg = doNinjutsuNuke(134,1,caster,spell,target,false,bonusAcc,bonusMab);
    handleNinjutsuDebuff(caster,target,spell,30,duration,MOD_WATERRES);

    return dmg;
end;