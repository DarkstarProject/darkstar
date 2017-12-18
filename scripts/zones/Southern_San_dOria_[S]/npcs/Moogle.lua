-----------------------------------
-- Area: Southern San d'Oria [S]
-- NPC:  Moogle
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil
require("scripts/zones/Southern_San_dOria_[S]/TextIDs")
require("scripts/globals/moghouse")

function onTrade(player,npc,trade)
    moogleTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if not moogleTrigger(player,npc) then
        player:startEvent(61)
    end
end

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid)
    -- printf("RESULT: %u",option)
    moogleEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid)
    -- printf("RESULT: %u",option)
    moogleEventFinish(player,csid,option)
end
