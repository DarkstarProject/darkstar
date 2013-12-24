-----------------------------------
--  Area: Attohwa Chasm
--  NPC:  ??? (qm1)
--  @pos -402.574 3.999 -202.750 7
-----------------------------------
package.loaded["scripts/zones/Attohwa_Chasm/TextIDs"] = nil;
-------------------------------------

require("scripts/zones/Attohwa_Chasm/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(OCCASIONAL_LUMPS);
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