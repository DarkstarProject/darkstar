-----------------------------------------
--  ID: 18393
--  Item: Sacred Wand
--  Enchantment: "Enlight"
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;
-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    effect = EFFECT_ENLIGHT;
    doEnspell(target,target,nil,effect);
end;
