-----------------------------------
-- Area: Port Bastok
--  NPC: Moogle
--
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Port_Bastok/TextIDs")
require("scripts/globals/moghouse")

function onTrade(player,npc,trade)
    moogleTrade(player,npc,trade)
end

function onTrigger(player,npc)
    moogleTrigger(player,npc)
end

function onEventUpdate(player,csid,option)
    moogleEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    moogleEventFinish(player,csid,option)
end
