-----------------------------------
-- Area: West Sarutabaruta [S]
--  NPC: Cavernous Maw
-- !pos 0 0 -165 95
-- Teleports Players to West Sarutabaruta
-----------------------------------
require("scripts/globals/teleports")
require("scripts/globals/campaign")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if not hasMawActivated(player,8) then
        player:startEvent(100)
    else
        player:startEvent(101)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if option == 1 then
        if csid == 100 then
            player:addNationTeleport(dsp.teleport.nation.MAW, 256)
        end
        dsp.teleport.toMaw(player, 8)
    end
end