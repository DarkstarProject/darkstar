-----------------------------------
-- Area: Qu'Bia Arena
-- Name: Celery
-- BCNM60
-----------------------------------

function onBcnmRegister(player,instance)
end;

function onBcnmEnter(player,instance)
end;

function onBcnmLeave(player,instance,leavecode)
    if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
        player:startEvent(32001,1,1,1,instance:getTimeInside(),1,16,0);
    elseif (leavecode == 4) then
        player:startEvent(32002);
    end
end;

function onEventUpdate(player,csid,option)
end;
    
function onEventFinish(player,csid,option)
end;
