-----------------------------------
-- Area: Oldton Movalpolos
--  NPC: Rakorok
-----------------------------------
local ID = require("scripts/zones/Oldton_Movalpolos/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    npc:showText(npc, ID.text.RAKOROK_DIALOGUE)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
