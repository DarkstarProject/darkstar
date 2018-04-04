-----------------------------------------
-- Spell: Warp
-- Transports the user to their Home Point
-----------------------------------------
require("scripts/globals/teleports");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    target:addStatusEffectEx(dsp.effects.TELEPORT,0,TELEPORT_WARP,0,4);
    spell:setMsg(msgBasic.MAGIC_TELEPORT);
    return 0;
end;
