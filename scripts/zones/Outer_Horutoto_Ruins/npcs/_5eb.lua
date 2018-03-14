-----------------------------------
-- Area: Inner Horutoto Ruins
--  NPC: Gate: Magical Gizmo
-- Involved In Mission: Full Moon Fountain
-- !pos -291 0 -659 194
-----------------------------------
package.loaded["scripts/zones/Outer_Horutoto_Ruins/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Outer_Horutoto_Ruins/TextIDs");
require("scripts/zones/Outer_Horutoto_Ruins/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local CurrentMission = player:getCurrentMission(WINDURST);
    local MissionStatus = player:getVar("MissionStatus");

    if (
        CurrentMission == FULL_MOON_FOUNTAIN and
        MissionStatus == 1 and
        player:hasKeyItem(SOUTHWESTERN_STAR_CHARM) and
        not GetMobByID(FULL_MOON_FOUNTAIN_OFFSET + 0):isSpawned() and
        not GetMobByID(FULL_MOON_FOUNTAIN_OFFSET + 1):isSpawned() and
        not GetMobByID(FULL_MOON_FOUNTAIN_OFFSET + 2):isSpawned() and
        not GetMobByID(FULL_MOON_FOUNTAIN_OFFSET + 3):isSpawned()
    ) then
        for i = FULL_MOON_FOUNTAIN_OFFSET, FULL_MOON_FOUNTAIN_OFFSET + 3 do
            SpawnMob(i);
        end
        
    elseif (
        CurrentMission == FULL_MOON_FOUNTAIN and
        MissionStatus == 2 and
        GetMobByID(FULL_MOON_FOUNTAIN_OFFSET + 0):isDead() and
        GetMobByID(FULL_MOON_FOUNTAIN_OFFSET + 1):isDead() and
        GetMobByID(FULL_MOON_FOUNTAIN_OFFSET + 2):isDead() and
        GetMobByID(FULL_MOON_FOUNTAIN_OFFSET + 3):isDead()
    ) then
        player:startEvent(68);
        
    else
        player:messageSpecial(DOOR_FIRMLY_SHUT);
    end

    return 1;
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 68) then
        player:setVar("MissionStatus",3);
        player:delKeyItem(SOUTHWESTERN_STAR_CHARM);
    end
end;
