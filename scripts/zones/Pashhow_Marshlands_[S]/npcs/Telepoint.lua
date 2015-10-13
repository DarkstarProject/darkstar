-----------------------------------
-- Area: Pashhow Marshlands [S]
-- NPC:  Telepoint
-----------------------------------
package.loaded["scripts/zones/Pashhow_Marshlands_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Pashhow_Marshlands_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:hasKeyItem(PASHHOW_GATE_CRYSTAL) == false) then
		player:addKeyItem(PASHHOW_GATE_CRYSTAL);
		player:messageSpecial(KEYITEM_OBTAINED,PASHHOW_GATE_CRYSTAL);
	else
		player:messageSpecial(ALREADY_OBTAINED_TELE);
	end
	
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