-----------------------------------
-- Area: The_Garden_of_RuHmet
--  NPC: Luminus convergence
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.WHEN_ANGELS_FALL and player:getVar("PromathiaStatus")==5) then
        player:startEvent(204);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);
    if (csid==204) then
        player:completeMission(COP,dsp.mission.id.cop.WHEN_ANGELS_FALL);
        player:addMission(COP,dsp.mission.id.cop.DAWN);
        player:setVar("PromathiaStatus",0);
    end
end;