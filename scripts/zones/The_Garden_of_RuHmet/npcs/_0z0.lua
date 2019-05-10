-----------------------------------
-- Area: The_Garden_of_RuHmet
-- NPC:  _0z0
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/globals/bcnm");

function onTrade(player,npc,trade)
    
    if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return;
    end

end;

function onTrigger(player,npc)
    --player:addMission(COP, dsp.mission.id.cop.WHEN_ANGELS_FALL);
    --player:setVar("PromathiaStatus",3);
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.WHEN_ANGELS_FALL and player:getVar("PromathiaStatus")==3) then
        player:startEvent(203);
    elseif (EventTriggerBCNM(player,npc)) then
    elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.WHEN_ANGELS_FALL and player:getVar("PromathiaStatus")==5) then
        player:startEvent(205);
    end
    return 1;
end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);
    
    if (EventUpdateBCNM(player,csid,option)) then
        return 1;
    end
end;

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);
    if ( csid == 203) then
        player:setVar("PromathiaStatus",4);
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end

end;