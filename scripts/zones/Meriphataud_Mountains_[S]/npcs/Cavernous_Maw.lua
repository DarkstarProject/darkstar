-----------------------------------
-- Area: Meriphataud Mountains [S]
--  NPC: Cavernous Maw
-- !pos 597 -32 279 97
-- Teleports Players to Meriphataud Mountains
-----------------------------------
require("scripts/globals/teleports")
require("scripts/globals/campaign")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if not hasMawActivated(player, 5) then
        player:startEvent(102)
    else
        player:startEvent(103)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if option == 1 then
        if csid == 102 then
            player:addNationTeleport(dsp.teleport.nation.MAW, 32)
        end
        dsp.teleport.toMaw(player, 18)
    end
end