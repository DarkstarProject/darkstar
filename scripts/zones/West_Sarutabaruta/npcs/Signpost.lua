-----------------------------------
-- Area: West Sarutabaruta
-- NPC:  Signpost (18 total)
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

	if(npc:getID() == 17248816) or (npc:getID() == 17248817) then
		player:messageSpecial(SIGN_1);
	elseif(npc:getID() == 17248818) or (npc:getID() == 17248819) then
		player:messageSpecial(SIGN_3);
	elseif(npc:getID() == 17248820) or (npc:getID() == 17248821) then
		player:messageSpecial(SIGN_5);
	elseif(npc:getID() == 17248822) or (npc:getID() == 17248823) then
		player:messageSpecial(SIGN_7);
	elseif(npc:getID() == 17248824) or (npc:getID() == 17248825) then
		player:messageSpecial(SIGN_9);
	elseif(npc:getID() == 17248826) or (npc:getID() == 17248827) then
		player:messageSpecial(SIGN_11);
	elseif(npc:getID() == 17248828) or (npc:getID() == 17248829) then
		player:messageSpecial(SIGN_13);
	elseif(npc:getID() == 17248830) or (npc:getID() == 17248831) then
		player:messageSpecial(SIGN_15);
	elseif(npc:getID() == 17248832) or (npc:getID() == 17248833) then
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