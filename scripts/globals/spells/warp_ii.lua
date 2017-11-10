-----------------------------------------
-- Spell: Warp II
-- Transports player to their home point. Can cast on allies.
-----------------------------------------
require("scripts/globals/teleports");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    target:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_WARP,0,3.4);
    spell:setMsg(msgBasic.MAGIC_TELEPORT);
    return 0;
end;
