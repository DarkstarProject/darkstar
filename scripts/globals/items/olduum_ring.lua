-----------------------------------------
--      ID: 15769
--      Olduum Ring
--      Teleports to Wajoam Woodlands Leypoint
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
    target:setPos(-199, -10, 80, 94, 51);
end;
