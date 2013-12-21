-----------------------------------
-- Area:  Garlaige Citadel
-- NPC:   qm2 (???)
-- Notes: Used to obtain Pouch of Weighted Stones
-- @pos -365.119 -5.500 299.986 200
-----------------------------------
package.loaded["scripts/zones/Garlaige_Citadel/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Garlaige_Citadel/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:hasKeyItem(POUCH_OF_WEIGHTED_STONES) == false) then
		player:addKeyItem(POUCH_OF_WEIGHTED_STONES);
		player:messageSpecial(KEYITEM_OBTAINED,POUCH_OF_WEIGHTED_STONES);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;
