-----------------------------------
-- Area: Jugner Forest [S]
-- NPC:  Telepoint
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Jugner_Forest_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:hasKeyItem(JUGNER_GATE_CRYSTAL) == false) then
		player:addKeyItem(JUGNER_GATE_CRYSTAL);
		player:messageSpecial(KEYITEM_OBTAINED,JUGNER_GATE_CRYSTAL);
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