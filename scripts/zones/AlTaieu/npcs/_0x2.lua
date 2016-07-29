-----------------------------------
--  Area: Al'Taieu
--  NPC:  Rubious Crystal (West Tower) 
--  @pos -683.709 -6.250 -222.142 33
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
    if (player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY and player:getVar("PromathiaStatus") == 2 and player:getVar("[SEA][AlTieu]WestTower") == 0 and player:getVar("[SEA][AlTieu]WestTowerCS") == 0) then
        player:messageSpecial(OMINOUS_SHADOW);
        SpawnMob(WestTowerAern,180):updateClaim(player);
        SpawnMob(WestTowerAern+1,180):updateClaim(player);
        SpawnMob(WestTowerAern+2,180):updateClaim(player);
    elseif (player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY and player:getVar("PromathiaStatus") == 2 and player:getVar("[SEA][AlTieu]WestTower") == 1 and player:getVar("[SEA][AlTieu]WestTowerCS") == 0) then
        player:startEvent(0x00A2);
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
    if (csid == 0x00A2) then
        player:setVar("[SEA][AlTieu]WestTowerCS", 1);
        player:setVar("[SEA][AlTieu]WestTower", 0);
    end
end;