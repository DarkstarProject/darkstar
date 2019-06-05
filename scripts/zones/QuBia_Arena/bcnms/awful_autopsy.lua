require("scripts/globals/battlefield")

-----------------------------------
-- Area: Qu'Bia Arena
-- Name: An Awful Autopsy
-- BCNM50
-----------------------------------

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end



function onBattlefieldRegister(player,battlefield)
end;

function onBattlefieldEnter(player,battlefield)
end;

function onBattlefieldLeave(player,battlefield,leavecode)
    if leavecode == dsp.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
 -- play end CS. Need time and battle id for record keeping + storage
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002);
    end
end;

function onEventUpdate(player,csid,option)
end;
    
function onEventFinish(player,csid,option)
end;
