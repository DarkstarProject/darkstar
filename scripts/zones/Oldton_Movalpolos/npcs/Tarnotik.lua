-----------------------------------
-- Area: Oldton Movalpolos
--  NPC: Tarnotik
-- Type: Standard NPC
-- !pos 160.896 10.999 -55.659 11
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if player:getCurrentMission(COP) >= dsp.mission.id.cop.THREE_PATHS and npcUtil.tradeHas(trade, 1725) then
        player:startEvent(32)
    end
end

function onTrigger(player, npc)
    if player:getCurrentMission(COP) == dsp.mission.id.cop.THREE_PATHS and player:getCharVar("COP_Louverance_s_Path") == 7 then
        player:startEvent(34)
    else
        if math.random() < 0.5 then -- this isn't retail at all.
            player:startEvent(30)
        else
            player:startEvent(31)
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32 then
        player:confirmTrade()
        player:setPos(-116, -119, -620, 253, 13)
    elseif csid == 34 then
        player:setCharVar("COP_Louverance_s_Path", 8)
    end
end
