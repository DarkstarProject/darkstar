-----------------------------------
-- Area: Bastok Mines
--  NPC: Enigmatic Footprints
-- Entry NPC for Dynamis Divergence
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil
require("scripts/zones/Bastok_Mines/TextIDs")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    player:messageSpecial(TEAR_IN_FABRIC_OF_SPACE)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end