-----------------------------------------
-- Spell: Reraise
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
    target:addStatusEffect(EFFECT_RERAISE,1,0,3600); --reraise 1, 30min duration

    return EFFECT_RERAISE;
end;
