-----------------------------------
-- Area: Selbina
--  NPC: Lucia
-- !pos fill it in
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Selbina/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getZPos() > -28.750) then
        player:startEvent(221,player:getGil(),100);
    else
        player:startEvent(235);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 221 and player:getZPos() < -28.750) then
        player:delGil(100);
    end

end;