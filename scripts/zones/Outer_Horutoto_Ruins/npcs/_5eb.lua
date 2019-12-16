-----------------------------------
-- Area: Outer Horutoto Ruins
--  NPC: Gate: Magical Gizmo
-- Involved In Mission: Full Moon Fountain
-- !pos -291 0 -659 194
-----------------------------------
local ID = require("scripts/zones/Outer_Horutoto_Ruins/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local currentMission = player:getCurrentMission(WINDURST)
    local missionStatus = player:getCharVar("MissionStatus")

    if
        currentMission == dsp.mission.id.windurst.FULL_MOON_FOUNTAIN and
        missionStatus == 1 and
        player:hasKeyItem(dsp.ki.SOUTHWESTERN_STAR_CHARM) and
        not GetMobByID(ID.mob.FULL_MOON_FOUNTAIN_OFFSET + 0):isSpawned() and
        not GetMobByID(ID.mob.FULL_MOON_FOUNTAIN_OFFSET + 1):isSpawned() and
        not GetMobByID(ID.mob.FULL_MOON_FOUNTAIN_OFFSET + 2):isSpawned() and
        not GetMobByID(ID.mob.FULL_MOON_FOUNTAIN_OFFSET + 3):isSpawned()
    then
        for i = ID.mob.FULL_MOON_FOUNTAIN_OFFSET, ID.mob.FULL_MOON_FOUNTAIN_OFFSET + 3 do
            SpawnMob(i)
        end

    elseif
        currentMission == dsp.mission.id.windurst.FULL_MOON_FOUNTAIN and
        missionStatus == 2 and
        GetMobByID(ID.mob.FULL_MOON_FOUNTAIN_OFFSET + 0):isDead() and
        GetMobByID(ID.mob.FULL_MOON_FOUNTAIN_OFFSET + 1):isDead() and
        GetMobByID(ID.mob.FULL_MOON_FOUNTAIN_OFFSET + 2):isDead() and
        GetMobByID(ID.mob.FULL_MOON_FOUNTAIN_OFFSET + 3):isDead()
    then
        player:startEvent(68)

    else
        player:messageSpecial(ID.text.DOOR_FIRMLY_SHUT)
    end

    return 1
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 68 then
        player:setCharVar("MissionStatus", 3)
        player:delKeyItem(dsp.ki.SOUTHWESTERN_STAR_CHARM)
    end
end
