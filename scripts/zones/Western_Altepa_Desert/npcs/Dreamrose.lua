-----------------------------------
-- Area: Western Altepa Desert
-- NPC:  Dreamrose
-- Involved in Mission: San D'Oria 6-1
-----------------------------------
package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Western_Altepa_Desert/TextIDs");
require("scripts/zones/Western_Altepa_Desert/MobIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

function onTrade(player,npc,trade)
end; 

function onTrigger(player,npc)
    local currentMission = player:getCurrentMission(SANDORIA);
    local MissionStatus = player:getVar("MissionStatus");
    
    if (currentMission == LEAUTE_S_LAST_WISHES and MissionStatus == 2 and not GetMobByID(SABOTENDER_ENAMORADO):isSpawned()) then
        if (player:getVar("Mission6-1MobKilled") == 1) then
            player:addKeyItem(DREAMROSE);
            player:messageSpecial(KEYITEM_OBTAINED,DREAMROSE);
            player:setVar("Mission6-1MobKilled",0);
            player:setVar("MissionStatus",3);
        else
            SpawnMob(SABOTENDER_ENAMORADO):updateClaim(player);
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end; 

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
