-----------------------------------
-- Area: Western Altepa Desert
-- NPC:  qm2 (???)
-- Involved in Mission: Bastok 6-1
-- !pos -325 0 -111 125
-----------------------------------
package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Western_Altepa_Desert/TextIDs");
require("scripts/zones/Western_Altepa_Desert/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(BASTOK) == RETURN_OF_THE_TALEKEEPER and player:getVar("MissionStatus") == 2 and
        player:hasKeyItem(ALTEPA_MOONPEBBLE) == false) then
        if (not GetMobByID(EASTERN_SPHINX):isSpawned() and not GetMobByID(WESTERN_SPHINX):isSpawned()) then
            if (player:getVar("Mission6-1MobKilled") > 0) then
                player:addKeyItem(ALTEPA_MOONPEBBLE);
                player:messageSpecial(KEYITEM_OBTAINED,ALTEPA_MOONPEBBLE);
                player:setVar("Mission6-1MobKilled",0);
                player:setVar("MissionStatus",3);
            else
                SpawnMob(EASTERN_SPHINX);
                SpawnMob(WESTERN_SPHINX);
            end
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
