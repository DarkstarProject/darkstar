-----------------------------------
--  Area: Al'Taieu
--  NPC:  Rubious Crystal (East Tower)
-- !pos 683.718 -6.250 -222.167 33
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/AlTaieu/TextIDs");
require("scripts/zones/AlTaieu/MobIDs");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (
            player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY
        and player:getVar("PromathiaStatus") == 2
        and player:getVar("[SEA][AlTieu]EastTower") == 0
        and player:getVar("[SEA][AlTieu]EastTowerCS") == 0
        and not GetMobByID(AERNS_TOWER_EAST+0):isSpawned()
        and not GetMobByID(AERNS_TOWER_EAST+1):isSpawned()
        and not GetMobByID(AERNS_TOWER_EAST+2):isSpawned()
    ) then
        player:messageSpecial(OMINOUS_SHADOW);
        SpawnMob(AERNS_TOWER_EAST+0):updateClaim(player);
        SpawnMob(AERNS_TOWER_EAST+1):updateClaim(player);
        SpawnMob(AERNS_TOWER_EAST+2):updateClaim(player);

    elseif (
            player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY
        and player:getVar("PromathiaStatus") == 2
        and player:getVar("[SEA][AlTieu]EastTower") == 1
        and player:getVar("[SEA][AlTieu]EastTowerCS") == 0
    ) then
        player:startEvent(163);

    else
        player:messageSpecial(NOTHING_OF_INTEREST);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 163) then
        player:setVar("[SEA][AlTieu]EastTowerCS", 1);
        player:setVar("[SEA][AlTieu]EastTower", 0);
    end
end;
