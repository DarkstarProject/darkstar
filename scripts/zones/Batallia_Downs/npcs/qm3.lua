-----------------------------------
-- Area: Batallia Downs
--  NPC: qm3 (???)
--  Involved in Mission 9-1 (San dOria)
--  !pos 210 17 -615 105
-----------------------------------
package.loaded["scripts/zones/Batallia_Downs/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Batallia_Downs/TextIDs");
require("scripts/zones/Batallia_Downs/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

function onTrigger(player,npc)
    if (player:getCurrentMission(SANDORIA) == BREAKING_BARRIERS and player:getVar("MissionStatus") == 3
        and not GetMobByID(SUPARNA):isSpawned() and not GetMobByID(SUPARNA_FLEDGLING):isSpawned()) then
        if (player:getVar("Mission9-1Kills") > 0) then
            player:startEvent(904);
        else
            SpawnMob(SUPARNA);
            SpawnMob(SUPARNA_FLEDGLING);
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 904) then
        player:addKeyItem(FIGURE_OF_LEVIATHAN);
        player:messageSpecial(KEYITEM_OBTAINED,FIGURE_OF_LEVIATHAN);
        player:setVar("MissionStatus",4);
        player:setVar("Mission9-1Kills",0);
    end
end;
