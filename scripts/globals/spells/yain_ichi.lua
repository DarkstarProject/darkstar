--------------------------------------
--     Spell: Yain: Ichi
--     Grants Enmity Down +15 for Caster
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
    caster:delStatusEffect(dsp.effect.ENMITY_BOOST);
    
    local effect = dsp.effect.PAX;
    caster:addStatusEffect(effect,15,0,300);
    return effect;
end;