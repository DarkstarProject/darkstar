-----------------------------------------
-- Spell: Paralyna
-- Removes paralysis from target.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    if (target:getStatusEffect(EFFECT.PARALYSIS) ~= nil) then
        target:delStatusEffect(EFFECT.PARALYSIS);
        spell:setMsg(msgBasic.MAGIC_REMOVE_EFFECT);
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end
    return EFFECT.PARALYSIS;
end;
