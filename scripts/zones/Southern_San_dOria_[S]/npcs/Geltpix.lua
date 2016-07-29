-----------------------------------
-- Area: Southern SandOria [S]
-- NPC: Geltpix
-- @zone 80
-- @pos 154 -2 103
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
player:showText(npc, 7043); -- Don't hurt poor Geltpix! Geltpix's just a merchant from Boodlix's Emporium in Jeuno. Kingdom vendors don't like gil, but Boodlix knows true value of new money.
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;