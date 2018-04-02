--------------------------------------
--     Spell: Aurorastorm
--     Changes the weather around target party member to "auroras."
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
    
    target:delStatusEffectSilent(EFFECT.FIRESTORM);
    target:delStatusEffectSilent(EFFECT.SANDSTORM);
    target:delStatusEffectSilent(EFFECT.RAINSTORM);
    target:delStatusEffectSilent(EFFECT.WINDSTORM);
    target:delStatusEffectSilent(EFFECT.HAILSTORM);
    target:delStatusEffectSilent(EFFECT.THUNDERSTORM);
    target:delStatusEffectSilent(EFFECT.AURORASTORM);
    target:delStatusEffectSilent(EFFECT.VOIDSTORM);
    
    local merit = caster:getMerit(MERIT_STORMSURGE);
    local power = 0;
    if merit > 0 then
        power = merit + caster:getMod(MOD_STORMSURGE_EFFECT) + 2;
    end
    target:addStatusEffect(EFFECT.AURORASTORM,power,0,180);
    return EFFECT.AURORASTORM;
end;