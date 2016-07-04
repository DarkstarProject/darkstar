-----------------------------------
-- Area: Valkurm Dunes
-- NPC:  qm3 (???)
-- Involved In Quest: Yomi Okuri
-- @pos -767 -4 192 103
-----------------------------------
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Valkurm_Dunes/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local cstime = VanadielHour();
    
    if (player:hasKeyItem(YOMOTSU_HIRASAKA) and (cstime > 18 or cstime < 5) and GetMobAction(17199567) == 0 and GetMobAction(17199568) == 0) then
        if (player:getVar("OkuriNMKilled") >= 1 and player:needToZone()) then
            player:delKeyItem(YOMOTSU_HIRASAKA);
            player:addKeyItem(FADED_YOMOTSU_HIRASAKA);
            player:messageSpecial(KEYITEM_OBTAINED,FADED_YOMOTSU_HIRASAKA);
            player:setVar("OkuriNMKilled",0);
        else
            player:startEvent(0x000a);
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    
    if (csid == 0x000a and option == 1) then
        player:needToZone(true); -- If you zone, you will need to repeat the fight. 
        player:setVar("OkuriNMKilled",0);
        SpawnMob(17199567,300):updateClaim(player); -- Doman
        SpawnMob(17199568,300):updateClaim(player); -- Onryo
    end
    
end;