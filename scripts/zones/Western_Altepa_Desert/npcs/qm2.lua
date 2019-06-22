-----------------------------------
-- Area: Western Altepa Desert
--  NPC: qm2 (???)
-- Involved in Mission: Bastok 6-1
-- !pos -325 0 -111 125
-----------------------------------
local ID = require("scripts/zones/Western_Altepa_Desert/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if
        player:getCurrentMission(BASTOK) == dsp.mission.id.bastok.RETURN_OF_THE_TALEKEEPER and
        player:getVar("MissionStatus") == 2 and
        not player:hasKeyItem(dsp.ki.ALTEPA_MOONPEBBLE)
    then
        if not GetMobByID(ID.mob.EASTERN_SPHINX):isSpawned() and not GetMobByID(ID.mob.WESTERN_SPHINX):isSpawned() then
            if player:getVar("Mission6-1MobKilled") > 0 then
                player:addKeyItem(dsp.ki.ALTEPA_MOONPEBBLE)
                player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.ALTEPA_MOONPEBBLE)
                player:setVar("Mission6-1MobKilled", 0)
                player:setVar("MissionStatus", 3)
            else
                SpawnMob(ID.mob.EASTERN_SPHINX)
                SpawnMob(ID.mob.WESTERN_SPHINX)
            end
        end
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
