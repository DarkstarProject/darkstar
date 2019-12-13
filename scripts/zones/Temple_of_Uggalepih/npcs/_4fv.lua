-----------------------------------
-- Area: Temple of Uggalepih
--  NPC: Granite Door
-- Involved in Missions: San dOria Mission 8-2
-- !pos -50 -17 -154
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getCurrentMission(SANDORIA) == dsp.mission.id.sandoria.LIGHTBRINGER and player:getCharVar("MissionStatus") == 5 then
        if
            player:hasKeyItem(dsp.ki.PIECE_OF_A_BROKEN_KEY1) and
            player:hasKeyItem(dsp.ki.PIECE_OF_A_BROKEN_KEY2) and
            player:hasKeyItem(dsp.ki.PIECE_OF_A_BROKEN_KEY3) and
            not GetMobByID(ID.mob.NIO_A):isSpawned() and
            not GetMobByID(ID.mob.NIO_HUM):isSpawned()
        then
            if player:getCharVar("Mission8-2Kills") > 0 then
                player:startEvent(65)
            else
                SpawnMob(ID.mob.NIO_A)
                SpawnMob(ID.mob.NIO_HUM)
            end
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 65 then
        player:setCharVar("Mission8-2Kills", 0)
        player:setCharVar("MissionStatus", 6)
    end
end
