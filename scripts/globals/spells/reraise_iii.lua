-----------------------------------------
-- Spell: Reraise 3
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    --duration = 1800;
    target:delStatusEffect(EFFECT.RERAISE);
    target:addStatusEffect(EFFECT.RERAISE,3,0,3600); --reraise 3, 30min duration

    return EFFECT.RERAISE;
end;
