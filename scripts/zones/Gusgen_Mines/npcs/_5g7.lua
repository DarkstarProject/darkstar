-----------------------------------
-- Area: Gusgen Mines
--  NPC: Strange Apparatus
-- !pos 219 -39 255 196
-----------------------------------
package.loaded["scripts/zones/Gusgen_Mines/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Gusgen_Mines/TextIDs")
require("scripts/globals/strangeapparatus")
-----------------------------------

function onTrade(player,npc,trade)
    dsp.strangeApparatus.onTrade(player, trade, 2)
end

function onTrigger(player,npc)
    dsp.strangeApparatus.onTrigger(player, 0)
end

function onEventUpdate(player,csid,option)
    if csid == 0 then
        dsp.strangeApparatus.onEventUpdate(player, option)
    end
end

function onEventFinish(player,csid,option)
    if csid == 2 then
        dsp.strangeApparatus.onEventFinish(player)
    end
end
