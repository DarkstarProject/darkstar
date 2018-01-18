-----------------------------------------
-- ID: 14497
-- Item: High Healing Harness
-- Item Effect: Restores 90-105 HP
-----------------------------------------
require("scripts/globals/msg");

function onItemCheck(target)
    if (target:getHP() == target:getMaxHP()) then
        return msgBasic.ITEM_UNABLE_TO_USE;
    end
    return 0;
end;

function onItemUse(target)
    local hpHeal = math.random(90,105);
    local dif = target:getMaxHP() - target:getHP();
    if (hpHeal > dif) then
        hpHeal = dif;
    end
    target:addHP(hpHeal);
    target:messageBasic(msgBasic.RECOVERS_HP,0,hpHeal);
end;