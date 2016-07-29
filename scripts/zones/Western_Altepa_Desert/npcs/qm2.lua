-----------------------------------
-- Area: Western Altepa Desert
-- NPC:  qm2 (???)
-- Involved in Mission: Bastok 6-1
-- @pos -325 0 -111 125
-----------------------------------
package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Western_Altepa_Desert/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getCurrentMission(BASTOK) == RETURN_OF_THE_TALEKEEPER and player:getVar("MissionStatus") == 2) then
        if (GetMobAction(17289654) == 0 and GetMobAction(17289655) == 0) then
            if (player:getVar("Mission6-1MobKilled") >= 1) then
                player:addKeyItem(ALTEPA_MOONPEBBLE);
                player:messageSpecial(KEYITEM_OBTAINED,ALTEPA_MOONPEBBLE);
                player:setVar("Mission6-1MobKilled",0);
                player:setVar("MissionStatus",3);
            else
                SpawnMob(17289654,168);
                SpawnMob(17289655,168);
            end
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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