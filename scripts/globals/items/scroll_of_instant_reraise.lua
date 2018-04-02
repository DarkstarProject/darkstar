-----------------------------------------
-- ID: 4182
--  Scroll of Instant ReRaise
--  Brings you back from the dead~!
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    local power = 1;
    local duration = 1800;
    if (target:hasStatusEffect(EFFECT.RERAISE)) then
        local effect = target:getStatusEffect(EFFECT.RERAISE);
        local oPower = effect:getPower();
        if (oPower > power) then
            target:messageBasic(msgBasic.NO_EFFECT);
        else
            target:delStatusEffect(EFFECT.RERAISE);
            target:addStatusEffect(EFFECT.RERAISE,power,0,duration);
        end
    else
        target:addStatusEffect(EFFECT.RERAISE,power,0,duration);
    end
end;
