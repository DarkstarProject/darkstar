-----------------------------------
-- Area: Misareaux Coast
--  NPC: Spacial Displacement
--  Entrance to Riverne Site #A01 and #B01
-----------------------------------
package.loaded["scripts/zones/Misareaux_Coast/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Misareaux_Coast/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasCompletedMission(COP,SHELTERING_DOUBT)) then
        player:startEvent(551); -- Access to Sites A & B
    elseif (player:getCurrentMission(COP) == ANCIENT_VOWS and player:getVar("PromathiaStatus") == 1) then
        player:startEvent(8);
    else
        player:startEvent(550); -- Access to Site A Only
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 8) then
        player:setVar("PromathiaStatus",2);
        player:setPos(732.55,-32.5,-506.544,90,30); -- Go to Riverne #A01 {R}
    elseif ((csid == 551 or csid == 550) and option == 1) then
        player:setPos(732.55,-32.5,-506.544,90,30); -- Go to Riverne #A01 {R}
    elseif (csid == 551 and option == 2) then
        player:setPos(729.749,-20.319,407.153,90,29); -- Go to Riverne #B01 {R}
    end;

end;