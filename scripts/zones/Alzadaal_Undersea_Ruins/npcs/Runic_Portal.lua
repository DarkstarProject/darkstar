-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: Runic Portal
-- Arrapago Reef Teleporter Back to Aht Urgan Whitegate
-- !pos 206.500 -1.220 33.500 72
-- !pos 206.500 -1.220 6.500 72
-----------------------------------
local ID = require("scripts/zones/Alzadaal_Undersea_Ruins/IDs")
-----------------------------------
require("scripts/globals/besieged")
require("scripts/globals/missions")
require("scripts/globals/teleports")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local npcid = npc:getID()
    local event = nil

    if player:getCurrentMission(TOAU) == dsp.mission.id.toau.IMMORTAL_SENTRIES and player:getCharVar("AhtUrganStatus") == 1 then
        event = npcid == ID.npc.RUNIC_PORTAL_NORTH and 121 or 122
    elseif player:getCurrentMission(TOAU) > dsp.mission.id.toau.IMMORTAL_SENTRIES then
        if dsp.besieged.hasRunicPortal(player, dsp.teleport.runic_portal.NYZUL) then
            event = npcid == ID.npc.RUNIC_PORTAL_NORTH and 117 or 118
        else
            event = npcid == ID.npc.RUNIC_PORTAL_NORTH and 121 or 122
        end
    else
        player:messageSpecial(ID.text.RESPONSE)
    end

    if event then
        player:startEvent(event)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if option == 1 then
        if csid == 121 or csid == 122 then
            dsp.besieged.addRunicPortal(player, dsp.teleport.runic_portal.NYZUL)
        end
        dsp.teleport.toChamberOfPassage(player)
    end
end