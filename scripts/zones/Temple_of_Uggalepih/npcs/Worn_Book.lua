-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Worn Book
-- Getting "Old Rusty Key (keyitem)"
-- @pos 59 0 19 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	npcid = npc:getID();
	rusty = player:hasKeyItem(OLD_RUSTY_KEY);
	 soul = player:hasKeyItem(PAINTBRUSH_OF_SOULS);
	
	if(soul or rusty) then
		player:messageSpecial(NO_REASON_TO_INVESTIGATE);
	elseif(npcid == 17428949) then
		player:startEvent(0x003D); -- First Book
	elseif(npcid == 17428950) then
		player:startEvent(0x003E); -- Second Book
	elseif(npcid == 17428951) then
		player:startEvent(0x003F); -- Third Book
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
	
	book = player:getVar("paintbrushOfSouls_book");
	
	if(csid == 0x003d and option == 1 and (book == 0 or book == 2 or book == 4 or book == 6)) then
		player:setVar("paintbrushOfSouls_book",book + 1);
	elseif(csid == 0x003e and option == 1 and (book == 0 or book == 1 or book == 4 or book == 5)) then
		player:setVar("paintbrushOfSouls_book",book + 2);
	elseif(csid == 0x003f and option == 1 and (book == 0 or book == 1 or book == 2 or book == 3)) then
		player:setVar("paintbrushOfSouls_book",book + 4);
	end
		
	if(player:getVar("paintbrushOfSouls_book") == 7) then
		player:messageSpecial(FALLS_FROM_THE_BOOK,OLD_RUSTY_KEY);
		player:addKeyItem(OLD_RUSTY_KEY);
		player:messageSpecial(KEYITEM_OBTAINED,OLD_RUSTY_KEY);
		player:setVar("paintbrushOfSouls_book",0);
	end
	
end;