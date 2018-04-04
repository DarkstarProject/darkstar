--------------------------------------
--     Spell: Boost-DEX
--     Boosts DEX for Allies in AoE
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
    local effect = dsp.effects.DEX_BOOST;
    doBoostGain(caster,target,spell,effect);
    return effect;
end;