--------------------------------------
--     Spell: Gekka: Ichi
--     Grants Enmity Boost +30 for Caster
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
    caster:delStatusEffect(dsp.effects.PAX);

    local effect = dsp.effects.ENMITY_BOOST;
    caster:addStatusEffect(effect,30,0,300);
    return effect;
end;