-----------------------------------------
--    ID: 14991
--    Fire Bracers
--  Enchantment: "Enfire"
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
    local effect = EFFECT_ENFIRE;
    doEnspell(target,target,nil,effect);
end;
