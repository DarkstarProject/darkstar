-----------------------------------------
-- Spell: Enfire
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
    local effect = dsp.effects.ENFIRE;
    doEnspell(caster,target,spell,effect);
    return effect;
end;