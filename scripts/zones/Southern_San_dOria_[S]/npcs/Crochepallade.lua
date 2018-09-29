-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Crochepallade                 -- Name is Moogle for some reason
-- @zone 80
-- !pos -46 2 -8
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(329);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;