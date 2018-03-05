-----------------------------------
-- Area: Korroloka Tunnel
--  NPC: Excavation Point
-----------------------------------
package.loaded["scripts/zones/Korroloka_Tunnel/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/excavation");
require("scripts/zones/Korroloka_Tunnel/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    startExcavation(player,player:getZoneID(),npc,trade,0x0000);
end;

function onTrigger(player,npc)
    player:messageSpecial(MINING_IS_POSSIBLE_HERE,605);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;