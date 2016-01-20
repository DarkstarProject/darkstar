--------------------------------------
--     Spell: Hailstorm
--     Changes the weather around target party member to "snowy."
--------------------------------------
 
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
    
    target:delStatusEffectSilent(EFFECT_FIRESTORM);
    target:delStatusEffectSilent(EFFECT_SANDSTORM);
    target:delStatusEffectSilent(EFFECT_RAINSTORM);
    target:delStatusEffectSilent(EFFECT_WINDSTORM);
    target:delStatusEffectSilent(EFFECT_HAILSTORM);
    target:delStatusEffectSilent(EFFECT_THUNDERSTORM);
    target:delStatusEffectSilent(EFFECT_AURORASTORM);
    target:delStatusEffectSilent(EFFECT_VOIDSTORM);
    
    local merit = caster:getMerit(MERIT_STORMSURGE);
    local power = 0;
    if merit > 0 then
        power = merit + caster:getMod(MOD_STORMSURGE_EFFECT) + 2;
    end
    target:addStatusEffect(EFFECT_HAILSTORM,power,0,180);
    return EFFECT_HAILSTORM;
end;
