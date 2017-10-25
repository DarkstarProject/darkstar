-----------------------------------------
-- Spell: Flurry II
-----------------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    if target:addStatusEffect(EFFECT_FLURRY_II, 30, 0, 150) then
        spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end;

    return EFFECT_FLURRY_II;
end;
