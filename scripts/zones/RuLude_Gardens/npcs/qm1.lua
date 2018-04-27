-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: ???
-- NPC for Dynamis Divergence Quest
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil
require("scripts/zones/RuLude_Gardens/TextIDs")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end