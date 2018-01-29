-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Dilgeur                 -- Misnamed NPC, name is Crochepallade when it should be Dilgeur, swap pos with the NPC at -46 2 -8
-- @zone 80
-- !pos 22 2 3
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(330);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;