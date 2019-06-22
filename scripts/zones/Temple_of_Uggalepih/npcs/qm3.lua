-----------------------------------
-- Area: Temple of Uggalepih
--  NPC: ??? (Uggalepih Whistle ITEM)
-- !pos -150 0 -71 159
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if not player:hasItem(1184) then
        if npcUtil.giveItem(player, 1184) then -- Uggalepih Whistle
            npc:setStatus(dsp.status.DISAPPEAR)
            npc:updateNPCHideTime(7200) -- 2 hours
            -- TODO: ??? reappears at new position
        end
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end