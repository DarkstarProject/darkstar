-----------------------------------
-- Area: Dynamis Windurst
-- Name: Dynamis Windurst
-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
    
    SetServerVariable("[DynaWindurst]UniqueID",os.time());
    SetServerVariable("[DynaWindurst]Boss_Trigger",0);
    SetServerVariable("[DynaWindurst]Already_Received",0);
    
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
    
    player:setVar("DynamisID",GetServerVariable("[DynaWindurst]UniqueID"));
    local realDay = os.time();
    if (DYNA_MIDNIGHT_RESET == true) then
        realDay = getMidnight() - 86400;
    end
    local dynaWaitxDay = player:getVar("dynaWaitxDay");

    if ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) < realDay) then
        player:setVar("dynaWaitxDay",realDay);
    end
    
end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function onBcnmLeave(player,instance,leavecode)
--print("leave code "..leavecode);

    if (leavecode == 4) then
        GetNPCByID(17543480):setStatus(2);
        SetServerVariable("[DynaWindurst]UniqueID",0);
    end
    
end;