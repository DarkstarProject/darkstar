-----------------------------------------
--    ID: 14988
--    Stone Bangles
--  Enchantment: "Enstone"
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
    local effect = EFFECT_ENSTONE;
    doEnspell(target,target,nil,effect);
end;
