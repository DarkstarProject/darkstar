-----------------------------------
-- Area: Pso'Xja
-- NPC:  Stone Gate
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/PsoXja/TextIDs");
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

    local posZ = player:getZPos();
    
    if (player:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and player:getVar("PromathiaStatus")==3) then
        SpawnMob(16814361,240):updateClaim(player);
    elseif ((player:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and player:getVar("PromathiaStatus")==4)or player:hasCompletedMission(COP,THE_ENDURING_TUMULT_OF_WAR) or player:hasCompletedMission(COP,THE_LAST_VERSE)) then
        if (posZ < 318) then
            player:startEvent(0x0045);
        else
            player:startEvent(0x0046);
        end
    else
        player:messageSpecial(DOOR_LOCKED);
    end
    return 1;
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
end;