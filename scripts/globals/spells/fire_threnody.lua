-----------------------------------------
-- Spell: Threnody - MOD_FIRERES
-----------------------------------------
package.loaded["scripts/globals/magic"] = nil;
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    return handleThrenody(caster, target, spell, 50, 60, MOD_FIRERES);
end;
