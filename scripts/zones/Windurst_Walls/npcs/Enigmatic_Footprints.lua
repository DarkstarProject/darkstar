-----------------------------------
-- Area: Windurst Walls
--  NPC: Enigmatic Footprints
-- Entry NPC for Dynamis Divergence
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil
require("scripts/zones/Windurst_Walls/TextIDs")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    player:messageSpecial(TEAR_IN_FABRIC_OF_SPACE)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end