-----------------------------------
-- Area: King Ranperre's Tomb
--  NPC: ??? (qm1)
-- Notes: Used to teleport down the stairs
-- !pos -81 -1 -97 190
-----------------------------------
package.loaded["scripts/zones/King_Ranperres_Tomb/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/King_Ranperres_Tomb/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(10);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

-- TODO: Missing teleport-animation. Might be a core issue as to why it wont display.

    if (csid == 10 and option == 100) then
        player:setPos(-81.5,7.297,-127.919,71);
    end

end;