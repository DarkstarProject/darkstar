-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Enigmatic Footprints
-- Entry NPC for Dynamis Divergence
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil
require("scripts/zones/Southern_San_dOria/TextIDs")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    player:messageSpecial(TEAR_IN_FABRIC_OF_SPACE)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end