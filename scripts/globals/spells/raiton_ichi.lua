-----------------------------------------
-- Spell: Raiton: Ichi
-- Deals lightning damage to an enemy and lowers its resistance against earth.
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
    local duration = 15 + caster:getMerit(MERIT_RAITON_EFFECT) -- T1 bonus debuff duration
    local bonusAcc = 0;
    local bonusMab = caster:getMerit(MERIT_RAITON_EFFECT) + caster:getMod(MOD_NIN_NUKE_BONUS); -- T1 mag atk + "enhances Ninjustu damage" mod

    if (caster:isBehind(target,15) and caster:hasStatusEffect(EFFECT_INNIN)) then -- Innin mag atk bonus from behind, guesstimating angle at 15 degrees
        bonusMab = bonusMab + caster:getStatusEffect(EFFECT_INNIN):getPower();
    end

    local dmg = doNinjutsuNuke(28,1,caster,spell,target,false,bonusAcc,bonusMab);
    handleNinjutsuDebuff(caster,target,spell,30,duration,MOD_EARTHRES);

    return dmg;
end;