--------------------------------------
--     Spell: Windstorm
--     Changes the weather around target party member to "windy."
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
    
    target:delStatusEffectSilent(dsp.effects.FIRESTORM);
    target:delStatusEffectSilent(dsp.effects.SANDSTORM);
    target:delStatusEffectSilent(dsp.effects.RAINSTORM);
    target:delStatusEffectSilent(dsp.effects.WINDSTORM);
    target:delStatusEffectSilent(dsp.effects.HAILSTORM);
    target:delStatusEffectSilent(dsp.effects.THUNDERSTORM);
    target:delStatusEffectSilent(dsp.effects.AURORASTORM);
    target:delStatusEffectSilent(dsp.effects.VOIDSTORM);
    
    local merit = caster:getMerit(MERIT_STORMSURGE);
    local power = 0;
    if merit > 0 then
        power = merit + caster:getMod(MOD_STORMSURGE_EFFECT) + 2;
    end
    target:addStatusEffect(dsp.effects.WINDSTORM,power,0,180);
    return dsp.effects.WINDSTORM;
end;