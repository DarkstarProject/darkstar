-----------------------------------
--  Area: Jugner Forest (S)
--  NPC:  Glowing Pebbles
--  Type: Involved in Quest
--  @pos 
--  player:startEvent(0x006a); Left over Cutscene
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Jugner_Forest_[S]/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:getVar("Lakeside_Minuet_Progress") == 3 and player:hasKeyItem(STARDUST_PEBBLE) == false) then
		player:startEvent(0x0064);
		player:addKeyItem(STARDUST_PEBBLE);
		player:messageSpecial(KEYITEM_OBTAINED,STARDUST_PEBBLE);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

