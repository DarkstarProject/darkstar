-----------------------------------------
-- ID: 15194
-- Item: Maats Cap
-- Teleports to Ru'Lude gardens
-----------------------------------------
require("scripts/globals/teleports");
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    target:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_MAAT,0,1);
end;
