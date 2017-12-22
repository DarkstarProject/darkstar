-----------------------------------
--  Area: Al'Taieu
--  NPC:  Rubious Crystal (South Tower)
-- !pos 0 -6.250 -736.912 33
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

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (
            player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY
        and player:getVar("PromathiaStatus") == 2
        and player:getVar("[SEA][AlTieu]SouthTower") == 0
        and player:getVar("[SEA][AlTieu]SouthTowerCS") == 0
        and not GetMobByID(AERNS_TOWER_SOUTH+0):isSpawned()
        and not GetMobByID(AERNS_TOWER_SOUTH+1):isSpawned()
        and not GetMobByID(AERNS_TOWER_SOUTH+2):isSpawned()
    ) then
        player:messageSpecial(OMINOUS_SHADOW);
        SpawnMob(AERNS_TOWER_SOUTH+0):updateClaim(player);
        SpawnMob(AERNS_TOWER_SOUTH+1):updateClaim(player);
        SpawnMob(AERNS_TOWER_SOUTH+2):updateClaim(player);

    elseif (
            player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY
        and player:getVar("PromathiaStatus") == 2
        and player:getVar("[SEA][AlTieu]SouthTower") == 1
        and player:getVar("[SEA][AlTieu]SouthTowerCS") == 0
    ) then
        player:startEvent(161);

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
    if (csid == 161) then
        player:setVar("[SEA][AlTieu]SouthTowerCS", 1);
        player:setVar("[SEA][AlTieu]SouthTower", 0);
    end
end;
