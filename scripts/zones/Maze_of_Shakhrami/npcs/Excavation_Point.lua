-----------------------------------
-- Area: Maze of Shakhrami
--  NPC: Excavation Point
-- Used in Quest: The Holy Crest
-- !pos 234 0.1 -110 198
-----------------------------------
local ID = require("scripts/zones/Maze_of_Shakhrami/IDs")
require("scripts/globals/excavation")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if player:getVar("TheHolyCrest_Event") == 3 and not player:hasItem(1159) and npcUtil.tradeHas(trade, 605) then
        if npcUtil.giveItem(player, 1159) then -- Wyvern Egg
            player:confirmTrade()
        end
    else
        dsp.excavation.onTrade(player, npc, trade, 60)
    end

end

function onTrigger(player,npc)
    player:messageSpecial(ID.text.MINING_IS_POSSIBLE_HERE, 605)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end