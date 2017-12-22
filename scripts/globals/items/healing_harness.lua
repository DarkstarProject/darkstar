-----------------------------------------
-- ID: 14495
-- Item: Healing Harness
-- Item Effect: Restores 50-75 HP
-----------------------------------------
require("scripts/globals/msg");

function onItemCheck(target)
    if (target:getHP() == target:getMaxHP()) then
        return msgBasic.ITEM_UNABLE_TO_USE;
    end
    return 0;
end;

function onItemUse(target)
    local hpHeal = math.random(50,75);
    local dif = target:getMaxHP() - target:getHP();
    if (hpHeal > dif) then
        hpHeal = dif;
    end
    target:addHP(hpHeal);
    target:messageBasic(msgBasic.RECOVERS_HP, 0, hpHeal);
end;
