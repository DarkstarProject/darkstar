-----------------------------------------
-- ID: 15560
-- Item: Trooper's Ring
-- Item Effect: Restores 100-115 HP
-----------------------------------------
require("scripts/globals/msg");

function onItemCheck(target)
    if (target:getHP() == target:getMaxHP()) then
        return msgBasic.ITEM_UNABLE_TO_USE;
    end
    return 0;
end;

function onItemUse(target)
    local hpHeal = math.random(100,115);
    local dif = target:getMaxHP() - target:getHP();
    if (hpHeal > dif) then
        hpHeal = dif;
    end
    target:addHP(hpHeal);
    target:messageBasic(msgBasic.RECOVERS_HP,0,hpHeal);
end;
