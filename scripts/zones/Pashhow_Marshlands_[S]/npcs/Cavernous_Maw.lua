-----------------------------------
-- Area: Pashhow Marshlands [S]
--  NPC: Cavernous Maw
-- !pos 418 25 27 90
-- Teleports Players to Pashhow_Marshlands
-----------------------------------
require("scripts/globals/teleports")
require("scripts/globals/campaign")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if not hasMawActivated(player, 4) then
        player:startEvent(100)
    else
        player:startEvent(101)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if option == 1 then
        if csid == 100 then
            player:addNationTeleport(dsp.teleport.nation.MAW, 16)
        end
        dsp.teleport.toMaw(player, 16)
    end
end