-----------------------------------
-- Area: Chateau d'Oraguille
--  NPC: Faurie
-- Chat Text and Zone Exit Menu
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Chateau_dOraguille/TextIDs");
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(506);
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    -- printf("CSID:",csid);
    -- printf("RESULT:",option);
    if (option == 0) then
        player:setPos(0, 0, 100, 64, 231);
    end;
end;
