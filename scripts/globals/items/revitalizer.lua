-----------------------------------------
-- ID: 4157
-- Item: Revitalizer
-- Item Effect: Removes 60 HP over 180 seconds
-----------------------------------------
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    target:resetRecasts();
    target:messageBasic(msgBasic.ALL_ABILITIES_RECHARGED, 0);
end;
