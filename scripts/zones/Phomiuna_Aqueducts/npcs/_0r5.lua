-----------------------------------
-- Area: Phomiuna_Aqueducts
--  NPC: Ornate Gate
-- !pos -95 -24 60 27
-----------------------------------
package.loaded["scripts/zones/Phomiuna_Aqueducts/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Phomiuna_Aqueducts/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) == DISTANT_BELIEFS and player:getVar("PromathiaStatus") == 2) then
        player:startEvent(36);
    else
        player:messageSpecial(NOTHING_OUT_HERE);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 36) then
        player:setVar("PromathiaStatus",3);
    end

end;