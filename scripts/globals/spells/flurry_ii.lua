-----------------------------------------
-- Spell: Flurry II
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    if target:addStatusEffect(EFFECT_FLURRY_II, 30, 0, 150) then
        spell:setMsg(236);
    else
        spell:setMsg(75);
    end;

    return EFFECT_FLURRY_II;
end;