-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Justinius
-- Involved in mission : COP2-3
-- !pos 76 -34 68 26
-----------------------------------
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) == DISTANT_BELIEFS and player:getVar("PromathiaStatus") == 3) then
        player:startEvent(113);
    elseif (player:getCurrentMission(COP) == SHELTERING_DOUBT and player:getVar("PromathiaStatus") == 2) then
        player:startEvent(109);
    elseif (player:getCurrentMission(COP) == THE_SAVAGE and player:getVar("PromathiaStatus") == 2) then
        player:startEvent(110);
    else
        player:startEvent(123);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 113) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,DISTANT_BELIEFS);
        player:addMission(COP,AN_ETERNAL_MELODY);
    elseif (csid == 109) then
        player:setVar("PromathiaStatus",3);
    elseif (csid == 110) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,THE_SAVAGE);
        player:addMission(COP,THE_SECRETS_OF_WORSHIP);
        player:addTitle(NAGMOLADAS_UNDERLING);
    end

end;