-----------------------------------
-- Area: Caedarva Mire
--  NPC: Runic Portal
-- Caedarva Mire Teleporter Back to Aht Urhgan Whitegate
-- !pos -264 -6 -28 79 (Dvucca)
-- !pos 524 -28 -503 79 (Azouph)
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs")
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
        event = npcid == ID.npc.RUNIC_PORTAL_AZOUPH and 124 or 125
    elseif player:getCurrentMission(TOAU) > dsp.mission.id.toau.IMMORTAL_SENTRIES then
        local runicPortal = npcid == ID.npc.RUNIC_PORTAL_AZOUPH and dsp.teleport.runic_portal.AZOUPH or dsp.teleport.runic_portal.DVUCCA
        if dsp.besieged.hasRunicPortal(player, runicPortal) then
            event = npcid == ID.npc.RUNIC_PORTAL_AZOUPH and 131 or 134
        else
            event = npcid == ID.npc.RUNIC_PORTAL_AZOUPH and 124 or 125
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
        if csid == 124 then
            dsp.besieged.addRunicPortal(player, dsp.teleport.runic_portal.AZOUPH)
        elseif csid == 125 then
            dsp.besieged.addRunicPortal(player, dsp.teleport.runic_portal.DVUCCA)
        end

        dsp.teleport.toChamberOfPassage(player)
    end
end