-----------------------------------
-- Area: Quicksand Caves
-- NPC:  Fountain of Kings
-- !pos 567 18 -939 208
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Quicksand_Caves/TextIDs");
require("scripts/zones/Quicksand_Caves/MobIDs");
require("scripts/globals/missions");
require("scripts/globals/keyitems");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(SANDORIA) == COMING_OF_AGE and player:getVar("MissionStatus") == 2
        and not GetMobByID(VALOR):isSpawned() and not GetMobByID(HONOR):isSpawned()) then
        SpawnMob(VALOR);
        SpawnMob(HONOR);
    elseif (player:getCurrentMission(SANDORIA) == COMING_OF_AGE and player:getVar("MissionStatus") == 3
        and not GetMobByID(VALOR):isSpawned() and not GetMobByID(HONOR):isSpawned()) then
        player:addKeyItem(DROPS_OF_AMNIO);
        player:messageSpecial(KEYITEM_OBTAINED,DROPS_OF_AMNIO);
    else
        player:messageSpecial(POOL_OF_WATER);
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
