-----------------------------------
-- Area: Bhaflau Thickets
--  NPC: Runic Portal
-- Mamook Ja Teleporter Back to Aht Urgan Whitegate
-- !pos -211 -11 -818 52
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
-----------------------------------
require("scripts/globals/besieged")
require("scripts/globals/missions")
require("scripts/globals/teleports")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getCurrentMission(TOAU) == dsp.mission.id.toau.IMMORTAL_SENTRIES and player:getCharVar("AhtUrganStatus") == 1 then
        player:startEvent(111)
    elseif player:getCurrentMission(TOAU) > dsp.mission.id.toau.IMMORTAL_SENTRIES then
        if dsp.besieged.hasRunicPortal(player, dsp.teleport.runic_portal.MAMOOL) then
            player:startEvent(109)
        else
            player:startEvent(111)
        end
    else
        player:messageSpecial(ID.text.RESPONSE)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if option == 1 then
        if csid == 111 then
            dsp.besieged.addRunicPortal(player, dsp.teleport.runic_portal.MAMOOL)
        end
        dsp.teleport.toChamberOfPassage(player)
    end
end