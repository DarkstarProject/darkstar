-----------------------------------
--  Area: Attohwa Chasm
--  NPC:  Loose sand
-----------------------------------
package.loaded["scripts/zones/Attohwa_Chasm/TextIDs"] = nil;
-------------------------------------

require("scripts/zones/Attohwa_Chasm/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
    
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)

    local MEMORIESMAIDENStatus=player:getVar("MEMORIES_OF_A_MAIDEN_Status");

    if (player:hasKeyItem(MIMEO_JEWEL)==true) then
        player:setPos(322,-25,-12,30);--(temporary solution, the road to the top of the mountain doesn't work)  
    elseif (player:getCurrentMission(COP) == THE_ROAD_FORKS and MEMORIESMAIDENStatus==8 and player:hasKeyItem(MIMEO_JEWEL)==false and(os.time() - player:getVar("LioumereKilled")) < 200) then
        player:setVar("LioumereKilled",0);
        player:addKeyItem(MIMEO_JEWEL);
        player:messageSpecial(KEYITEM_OBTAINED, MIMEO_JEWEL);
        player:setPos(322,-25,-12,30); -- tp to the cradle of rebirth (temporary solution, the road to the top of the mountain doesn't work)
    elseif (player:getCurrentMission(COP) == THE_ROAD_FORKS and (MEMORIESMAIDENStatus==7 or MEMORIESMAIDENStatus==8) and player:hasKeyItem(MIMEO_JEWEL)==false) then
        SpawnMob(16806031,180):updateClaim(player);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
        player:setVar("LioumereKilled",0);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;