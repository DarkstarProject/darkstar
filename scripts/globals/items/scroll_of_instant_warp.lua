------------------------------------------- ID: 4181-- Scroll of Instant Warp-- Transports the user to their Home Point-----------------------------------------
require("scripts/globals/teleports");require("scripts/globals/status");
------------------------------------------- OnItemCheck-----------------------------------------function onItemCheck(target)    return 0;end;------------------------------------------- OnItemUse-----------------------------------------function onItemUse(target)    target:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_WARP,0,1);end;
