-----------------------------------
-- Area: Temenos
-- Name:
-----------------------------------



-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
end;

-- Leaving by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function onBcnmLeave(player,instance,leavecode)
--print("leave code "..leavecode);

    if (leavecode == 2 or leavecode == 3 or leavecode == 4) then
     --    player:setPos(0,0,0,0,0);
    end
    if (leavecode == 4) then
    end
end;