-----------------------------------
-- Area: Lower Delkfutt's Tower
--  NPC: Cermet Door
-- Notes: Involved in Missions: THREE_PATHS
-----------------------------------
package.loaded["scripts/zones/Lower_Delkfutts_Tower/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Lower_Delkfutts_Tower/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == THREE_PATHS  and  player:getVar("COP_Tenzen_s_Path") == 6 and player:hasKeyItem(DELKFUTT_RECOGNITION_DEVICE)) then
        SpawnMob(17531121):updateClaim(player);
    elseif (player:getCurrentMission(COP) == THREE_PATHS  and  player:getVar("COP_Tenzen_s_Path") == 7 and player:hasKeyItem(DELKFUTT_RECOGNITION_DEVICE)) then
        player:startEvent(25);
    end

    return 1;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID:",csid);
    -- printf("RESULT:",option);
     if (csid == 25) then
         player:setVar("COP_Tenzen_s_Path",8);
     end
end;