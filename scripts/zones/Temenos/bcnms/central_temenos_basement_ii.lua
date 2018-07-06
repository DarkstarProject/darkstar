-----------------------------------
-- Area: Temenos
-- Name: Central Temenos Basement II
-----------------------------------
require("scripts/globals/limbus");
require("scripts/globals/keyitems");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish the dynamis

function onBcnmLeave(player,instance,leavecode)
    --print("leave code "..leavecode);
    ResetPlayerLimbusVariable(player)
    if (leavecode == 4) then
        player:setPos(580,-1.5,4.452,192);
    end
end;