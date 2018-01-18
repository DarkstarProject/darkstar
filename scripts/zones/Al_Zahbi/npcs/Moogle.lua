-----------------------------------
-- Area: Al Zahbi
-- NPC:  Moogle
-- 
-----------------------------------
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Al_Zahbi/TextIDs")
require("scripts/globals/moghouse")

function onTrade(player,npc,trade)
    moogleTrade(player,npc,trade)
end

function onTrigger(player,npc)
    moogleTrigger(player,npc)
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
