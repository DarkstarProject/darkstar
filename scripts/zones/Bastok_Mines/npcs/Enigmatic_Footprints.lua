-----------------------------------
-- Area: Bastok Mines
--  NPC: Enigmatic Footprints
-- Entry NPC for Dynamis Divergence
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil
local ID = require("scripts/zones/Bastok_Mines/IDs.lua")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    player:messageSpecial(ID.text.TEAR_IN_FABRIC_OF_SPACE)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end