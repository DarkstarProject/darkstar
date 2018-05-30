-----------------------------------------
-- Spell: Barpetrify
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/spells/barstatus");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    return applyBarstatus(dsp.effect.BARPETRIFY,caster,target,spell)
end;
