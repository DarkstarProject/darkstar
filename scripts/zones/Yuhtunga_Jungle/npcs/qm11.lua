-----------------------------------
-- Area: Yuhtunga Jungle
--  NPC: ??? Rhapsodies of Vanadiel Mission 1-15 Impurity
-- !pos -409.553 17.356 -380.626 123
-----------------------------------
local ID = require("scripts/zones/Yuhtunga_Jungle/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getCurrentMission(ROV) == dsp.mission.id.rov.IMPURITY then
        player:startEvent(212)
    elseif player:getCurrentMission(ROV) == dsp.mission.id.rov.THE_LOST_AVATAR then
        -- Siren Battle then:
        player:startEvent(213)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 212 then
        player:completeMission(ROV, dsp.mission.id.rov.IMPURITY)
        player:addMission(ROV, dsp.mission.id.rov.THE_LOST_AVATAR)
    elseif csid == 213 then
        npcUtil.giveKeyItem(player, dsp.ki.RHAPSODY_IN_WHITE)
        player:completeMission(ROV, dsp.mission.id.rov.THE_LOST_AVATAR)
        player:addMission(ROV, dsp.mission.id.rov.VOLTO_OSCURO)
    end
end