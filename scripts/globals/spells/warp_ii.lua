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
    target:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.WARP,0,3.4);
    spell:setMsg(dsp.msg.basic.MAGIC_TELEPORT);
    return 0;
end;
