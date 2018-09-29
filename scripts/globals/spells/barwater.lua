-----------------------------------------
-- Spell: BARWATER
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
    return applyBarspell(dsp.effect.BARWATER,caster,target,spell)
end;
