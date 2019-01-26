-----------------------------------
-- Area: Western Altepa Desert
--  NPC: Dreamrose
-- Involved in Mission: San D'Oria 6-1
-----------------------------------
local ID = require("scripts/zones/Western_Altepa_Desert/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if
        player:getCurrentMission(SANDORIA) == LEAUTE_S_LAST_WISHES and
        player:getVar("MissionStatus") == 2 and
        not GetMobByID(ID.mob.SABOTENDER_ENAMORADO):isSpawned()
    then
        if player:getVar("Mission6-1MobKilled") == 1 then
            player:addKeyItem(dsp.ki.DREAMROSE)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.DREAMROSE)
            player:setVar("Mission6-1MobKilled", 0)
            player:setVar("MissionStatus", 3)
        else
            SpawnMob(ID.mob.SABOTENDER_ENAMORADO):updateClaim(player)
        end
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
