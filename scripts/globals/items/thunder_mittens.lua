-----------------------------------------
--    ID: 14987
--    Thunder Mittens
--  Enchantment: "Enthunder"
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
    local effect = EFFECT_ENTHUNDER;
    doEnspell(target,target,nil,effect);
end;
