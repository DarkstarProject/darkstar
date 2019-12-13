-----------------------------------
-- Area: Temple of Uggalepih
--  NPC: _4f3
-- Notes: Tonberry Priest Room (Offers Tonberry Hate Reset)
-- !pos 60.001 -1.653 -147.755 159
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local killCount = player:getCharVar("EVERYONES_GRUDGE_KILLS")

    if player:hasKeyItem(dsp.ki.TONBERRY_PRIEST_KEY) then
        if killCount >= 1 then
            local payment = 250 * (killCount / 20 + 1)
            player:startEvent(66, 0, payment)
        else
            player:messageSpecial(ID.text.NO_HATE) -- Hate is already 0
        end
    else
        player:messageSpecial(ID.text.DOOR_SHUT)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 66 and option == 1 then
        if player:delGil(250 * (player:getCharVar("EVERYONES_GRUDGE_KILLS") / 20 + 1)) then
            player:setCharVar("EVERYONES_GRUDGE_KILLS", 0)
            player:messageSpecial(ID.text.HATE_RESET)

            --[[
            TODO: The Priest should cast a spell on the player at the end of the Cutscene.

            GetNPCByID(ID.npc.PLONGEUR_MONBERRY):castSpell(260)
            local mob = GetNPCByID(ID.npc.PLONGEUR_MONBERRY)
            if mob ~= nil then
                mob:injectActionPacket( 43, 43 )
            else
                printf( "MOB IS NULL! %d", ID.npc.PLONGEUR_MONBERRY )
            end
            --]]
        end
    end
end
