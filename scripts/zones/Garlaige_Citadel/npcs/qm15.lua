-----------------------------------
-- Area: Garlaige Citadel
-- NPC:  qm15 (???)
-- Involved in Quest: Hitting the Marquisate (THF AF3)
-- @pos 19.893 -5.500 325.767 200
-----------------------------------
package.loaded["scripts/zones/Garlaige_Citadel/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Garlaige_Citadel/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local hittingTheMarquisateHagainCS = player:getVar("hittingTheMarquisateHagainCS");

    if (hittingTheMarquisateHagainCS == 8) then 
        player:messageSpecial(HEAT_FROM_CEILING);
        -- TODO: player must wait 10 minutes before they can spawn bomb again
        SpawnMob(17596533,120):updateClaim(player); -- Chandelier
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
end;
