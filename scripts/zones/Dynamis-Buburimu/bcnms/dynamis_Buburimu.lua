-----------------------------------
-- Area: dynamis_Buburimu
-- Name: dynamis_Buburimu
-----------------------------------



-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
    
    SetServerVariable("[DynaBuburimu]UniqueID",os.time());
    SetServerVariable("[DynaBuburimu]Boss_Trigger",0);
    SetServerVariable("[DynaBuburimu]Already_Received",0);
    
    
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
    
    player:setVar("DynamisID",GetServerVariable("[DynaBuburimu]UniqueID"));
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
        SetServerVariable("[DynaBuburimu]UniqueID",0);
    end
    
end;