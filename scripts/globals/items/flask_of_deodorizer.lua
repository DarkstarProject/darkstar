-----------------------------------------
--    ID: 4166
--    Deodorizer
--    When applied, this powerful deodorant neutralizes even the strongest of odors!!.
-----------------------------------------

require("scripts/globals/status");

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
    if (not target:hasStatusEffect(EFFECT_DEODORIZE)) then
        target:addStatusEffect(EFFECT_DEODORIZE,1,10,180);
    else
        target:messageBasic(283);
    end
end;
