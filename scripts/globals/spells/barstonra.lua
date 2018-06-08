-----------------------------------------
-- Spell: BARSTONRA
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/spells/barspell");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    return applyBarspell(dsp.effect.BARSTONE,caster,target,spell)
end;
