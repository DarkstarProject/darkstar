-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: Titan's Gate
-- !pos 100 -34 88 195
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Eldieme_Necropolis/TextIDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (npc:getAnimation() == 9) then
        if (player:hasKeyItem(MAGICKED_ASTROLABE)) then
            npc:openDoor(8);
        else
            player:messageSpecial(SOLID_STONE);
        end
    end
    return 0;
end;
--
function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;