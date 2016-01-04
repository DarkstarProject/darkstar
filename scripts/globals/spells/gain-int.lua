--------------------------------------
--     Spell: Gain-INT
--     Boosts INT for the Caster
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
    local effect = EFFECT_INT_BOOST;
    doBoostGain(caster,target,spell,effect);
    return effect;
end;