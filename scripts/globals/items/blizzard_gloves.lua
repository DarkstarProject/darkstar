-----------------------------------------
--    ID: 14990
--    Blizzard Gloves
--  Enchantment: "Enblizzard"
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
    local effect = EFFECT_ENBLIZZARD;
    doEnspell(target,target,nil,effect);
end;
