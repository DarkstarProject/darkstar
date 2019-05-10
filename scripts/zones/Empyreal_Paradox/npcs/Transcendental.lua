-----------------------------------
-- Area: Empyreal_Paradox
-- NPC:  Transcendental
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
    --player:addMission(COP, dsp.mission.id.cop.DAWN);
    --player:setVar("PromathiaStatus",3);
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.DAWN and player:getVar("PromathiaStatus")==1) then
        player:startEvent(2);
    elseif (EventTriggerBCNM(player,npc)) then
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);
    
    EventUpdateBCNM(player,csid,option)
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);
    if ( csid == 2) then
        player:setVar("PromathiaStatus",2);
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end

end;