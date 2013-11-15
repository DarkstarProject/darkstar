-----------------------------------
-- Area: West Sarutabaruta
-- NPC:  Signpost
-----------------------------------
package.loaded["scripts/zones/West_Sarutabaruta/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/West_Sarutabaruta/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if(npc:getID() == 17248758) or (npc:getID() == 17248759) then
		player:messageSpecial(SIGN_1);		
	elseif(npc:getID() == 17248760) or (npc:getID() == 17248761) then
		player:messageSpecial(SIGN_3);
	elseif(npc:getID() == 17248762) or (npc:getID() == 17248763) then
		player:messageSpecial(SIGN_5);
	elseif(npc:getID() == 17248764) or (npc:getID() == 17248765) then
		player:messageSpecial(SIGN_7);
	elseif(npc:getID() == 17248766) or (npc:getID() == 17248767) then
		player:messageSpecial(SIGN_9);
	elseif(npc:getID() == 17248768) or (npc:getID() == 17248769) then
		player:messageSpecial(SIGN_11);
	elseif(npc:getID() == 17248770) or (npc:getID() == 17248771) then
		player:messageSpecial(SIGN_13);
	elseif(npc:getID() == 17248772) or (npc:getID() == 17248773) then
		player:messageSpecial(SIGN_15);
	elseif(npc:getID() == 17248774) or (npc:getID() == 17248775) then
		player:messageSpecial(SIGN_17);		
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
--print("CSID: %u",csid);
--print("RESULT: %u",option);
end;