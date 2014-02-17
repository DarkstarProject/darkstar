-----------------------------------
--	Area: Abyssea-Attohwa
--	NPC: Monberaux
--	Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Abyssea-Attohwa/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Abyssea-Attohwa/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x017D);
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