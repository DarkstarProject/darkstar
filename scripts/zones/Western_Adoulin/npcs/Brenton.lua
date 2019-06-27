-----------------------------------
-- Area: Western Adoulin
--  NPC: Brenton
-- Type: SOA Mission NPC
-- !pos 127 -86.036 3.349
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
local ID = require("scripts/zones/Western_Adoulin/IDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local pioneerRegistration = player:getCurrentMission(SOA) == dsp.mission.id.soa.PIONEER_REGISTRATION

    if pioneerRegistration then
        player:startEvent(3)
    else
        player:startEvent(576)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 3 then
        player:addCurrency('bayld', 1000 * BAYLD_RATE);
        player:messageSpecial(ID.text.BAYLD_OBTAINED, 1000 * BAYLD_RATE);

        player:addKeyItem(dsp.ki.PIONEERS_BADGE) -- Notification for this is shown in the CS, so hand over quietly
        npcUtil.giveKeyItem(player, dsp.ki.MAP_OF_ADOULIN)

        player:completeMission(SOA,dsp.mission.id.soa.PIONEER_REGISTRATION)
        player:addMission(SOA,dsp.mission.id.soa.LIFE_ON_THE_FRONTIER)
    end
end
