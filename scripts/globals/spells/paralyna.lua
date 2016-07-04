-----------------------------------------
-- Spell: Paralyna
-- Removes paralysis from target.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    if (target:getStatusEffect(EFFECT_PARALYSIS) ~= nil) then
        target:delStatusEffect(EFFECT_PARALYSIS);
        spell:setMsg(83);
    else
        spell:setMsg(75);
    end
    return EFFECT_PARALYSIS;
end;