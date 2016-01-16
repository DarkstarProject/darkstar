-----------------------------------
--  Area: Al'Taieu
--  NPC:  Rubious Crystal (South Tower)
--  @pos 0 -6.250 -736.912 33
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/AlTaieu/TextIDs");
require("scripts/zones/AlTaieu/mobIDs");
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
    if (player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY and player:getVar("PromathiaStatus") == 2 and player:getVar("[SEA][AlTieu]SouthTower") == 0 and player:getVar("[SEA][AlTieu]SouthTowerCS") == 0) then
        player:messageSpecial(OMINOUS_SHADOW);
        SpawnMob(SouthTowerAern,180):updateClaim(player);
        SpawnMob(SouthTowerAern+1,180):updateClaim(player);
        SpawnMob(SouthTowerAern+2,180):updateClaim(player);
    elseif (player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY and player:getVar("PromathiaStatus") == 2 and player:getVar("[SEA][AlTieu]SouthTower") == 1 and player:getVar("[SEA][AlTieu]SouthTowerCS") == 0) then
        player:startEvent(0x00A1);
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
    if (csid == 0x00A1) then
        player:setVar("[SEA][AlTieu]SouthTowerCS", 1);
        player:setVar("[SEA][AlTieu]SouthTower", 0);
    end
end;