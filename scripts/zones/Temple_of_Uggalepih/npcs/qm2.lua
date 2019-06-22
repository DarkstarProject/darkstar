-----------------------------------
-- Area: Temple of Uggalepih
--  NPC: ??? (Uggalepih Offering ITEM)
-- !pos 388 0 269 159
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if not player:hasItem(1183) then
        if npcUtil.giveItem(player, 1183) then -- Uggalepih Offering
            npc:setStatus(dsp.status.DISAPPEAR)
            npc:updateNPCHideTime(math.random(900, 7200)) -- 15 minutes to 2 hours
            -- TODO: ??? reappears at new position
        end
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end