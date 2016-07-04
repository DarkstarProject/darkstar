-----------------------------------
-- Area: West Ronfaure
-- NPC:  qm4 (???)
-- Involved in Quest: The Dismayed Customer
-- @pos -399 -10 -438 100
-----------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/zones/West_Ronfaure/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getCurrentMission(SANDORIA,PRESTIGE_OF_THE_PAPSQUE) and player:getVar("MissionStatus") == 1) then
        if (GetMobAction(17187273) == 0) then
            if (player:getVar("Mission7-1MobKilled") == 1) then
                player:addKeyItem(ANCIENT_SANDORIAN_TABLET);
                player:messageSpecial(KEYITEM_OBTAINED,ANCIENT_SANDORIAN_TABLET);
                player:setVar("Mission7-1MobKilled",0);
                player:setVar("MissionStatus",2);
            else
                SpawnMob(17187273):updateClaim(player);
            end
        end
    end;
    
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
