-----------------------------------
-- Area: Dynamis Windurst
-- Name: Dynamis Windurst
require("scripts/globals/battlefield")
-----------------------------------

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBattlefieldRegister(player,battlefield)

    SetServerVariable("[DynaWindurst]UniqueID",os.time());
    SetServerVariable("[DynaWindurst]Boss_Trigger",0);
    SetServerVariable("[DynaWindurst]Already_Received",0);

end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBattlefieldEnter(player,battlefield)

    player:setVar("DynamisID",GetServerVariable("[DynaWindurst]UniqueID"));
    local realDay = os.time();
    if (DYNA_MIDNIGHT_RESET == true) then
        realDay = getMidnight() - 86400;
    end
    local dynaWaitxDay = player:getVar("dynaWaitxDay");

    if ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 60 * 60)) < realDay) then
        player:setVar("dynaWaitxDay",realDay);
    end

end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function onBattlefieldLeave(player,battlefield,leavecode)
--print("leave code "..leavecode);

    if leavecode == dsp.battlefield.leaveCode.LOST then
        GetNPCByID(17543480):setStatus(2);
        SetServerVariable("[DynaWindurst]UniqueID",0);
    end

end;