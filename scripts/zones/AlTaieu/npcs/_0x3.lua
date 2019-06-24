-----------------------------------
-- Area: Al'Taieu
--  NPC: Rubious Crystal (East Tower)
-- !pos 683.718 -6.250 -222.167 33
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) == dsp.mission.id.cop.GARDEN_OF_ANTIQUITY
        and player:getVar("PromathiaStatus") == 2
        and player:getVar("[SEA][AlTieu]EastTower") == 0
        and player:getVar("[SEA][AlTieu]EastTowerCS") == 0
        and not GetMobByID(ID.mob.AERNS_TOWER_EAST+0):isSpawned()
        and not GetMobByID(ID.mob.AERNS_TOWER_EAST+1):isSpawned()
        and not GetMobByID(ID.mob.AERNS_TOWER_EAST+2):isSpawned()
    ) then
        player:messageSpecial(ID.text.OMINOUS_SHADOW);
        SpawnMob(ID.mob.AERNS_TOWER_EAST+0):updateClaim(player);
        SpawnMob(ID.mob.AERNS_TOWER_EAST+1):updateClaim(player);
        SpawnMob(ID.mob.AERNS_TOWER_EAST+2):updateClaim(player);

    elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.GARDEN_OF_ANTIQUITY
        and player:getVar("PromathiaStatus") == 2
        and player:getVar("[SEA][AlTieu]EastTower") == 1
        and player:getVar("[SEA][AlTieu]EastTowerCS") == 0
    ) then
        player:startEvent(163);

    else
        player:messageSpecial(ID.text.NOTHING_OF_INTEREST);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 163) then
        player:setVar("[SEA][AlTieu]EastTowerCS", 1);
        player:setVar("[SEA][AlTieu]EastTower", 0);
    end
end;
