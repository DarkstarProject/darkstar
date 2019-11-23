-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Runic Portal
-- Aht Urhgan Teleporter to Other Areas
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
-----------------------------------
require("scripts/globals/besieged")
require("scripts/globals/keyitems")
require("scripts/globals/teleports")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local hasAssault, keyitem = dsp.besieged.hasAssaultOrders(player)

    if hasAssault > 0 then
        player:messageSpecial(ID.text.RUNIC_PORTAL + 9, keyitem)
        player:startEvent(hasAssault)
    else
        local hasPermit = player:hasKeyItem(dsp.ki.RUNIC_PORTAL_USE_PERMIT)
        local runicPortals = player:getTeleport(dsp.teleport.type.RUNIC_PORTAL)
        local mercRank = dsp.besieged.getMercenaryRank(player)
        local points = player:getCurrency("imperial_standing")
        local hasAstral = dsp.besieged.getAstralCandescence()
        player:startEvent(101, hasPermit and dsp.ki.RUNIC_PORTAL_USE_PERMIT or 0, runicPortals, mercRank, points, 0, hasAstral, hasPermit and 1 or 0)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    local offset = nil
    if csid == 101 then
        if option >= 101 and option <= 106 then
            offset = option - 101
            player:delKeyItem(dsp.ki.RUNIC_PORTAL_USE_PERMIT)
        elseif option >= 1001 and option <= 1006 then
            offset = option - 1001
            player:delCurrency("imperial_standing", 200)
        end
    elseif csid >= 120 and csid <= 125 and option == 1 then -- Has Assault Orders
        offset = csid - 120
    end

    if offset then
        dsp.teleport.to(player, dsp.teleport.id.AZOUPH_SP + offset)
    end
end