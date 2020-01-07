-----------------------------------
-- Area: West Ronfaure
--  NPC: qm4 (???)
-- Involved in Mission: San d'Orian Mission 7-1 (Prestige of the Papsque)
-- !pos -695 -40 21 100
-----------------------------------
local ID = require("scripts/zones/West_Ronfaure/IDs")
require("scripts/globals/missions")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if
        player:getCurrentMission(SANDORIA, dsp.mission.id.sandoria.PRESTIGE_OF_THE_PAPSQUE) and
        player:getCharVar("MissionStatus") == 1 and
        not GetMobByID(ID.mob.MARAUDER_DVOGZOG):isSpawned()
    then
        if player:getCharVar("Mission7-1MobKilled") == 1 and player:needToZone() then
            player:addKeyItem(dsp.ki.ANCIENT_SANDORIAN_TABLET)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.ANCIENT_SANDORIAN_TABLET)
            player:setCharVar("Mission7-1MobKilled", 0)
            player:setCharVar("MissionStatus", 2)
        else
            SpawnMob(ID.mob.MARAUDER_DVOGZOG):updateClaim(player)
        end
    end

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
