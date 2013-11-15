-----------------------------------
-- Area: East Sarutabaruta
-- NPC:  Signpost
-----------------------------------
package.loaded["scripts/zones/East_Sarutabaruta/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/East_Sarutabaruta/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if(npc:getID() == 17252993) or (npc:getID() == 17252994) then
		player:messageSpecial(SIGN_1);		
	elseif(npc:getID() == 17252995) or (npc:getID() == 17252996) then
		player:messageSpecial(SIGN_3);
	elseif(npc:getID() == 17252997) or (npc:getID() == 17252998) then
		player:messageSpecial(SIGN_5);
	elseif(npc:getID() == 17252999) or (npc:getID() == 17253000) then
		player:messageSpecial(SIGN_7);
	elseif(npc:getID() == 17253001) or (npc:getID() == 17253002) then
		player:messageSpecial(SIGN_9);
	elseif(npc:getID() == 17253003) or (npc:getID() == 17253004) then
		player:messageSpecial(SIGN_11);
	elseif(npc:getID() == 17253005) or (npc:getID() == 17253006) then
		player:messageSpecial(SIGN_13);
	elseif(npc:getID() == 17253007) or (npc:getID() == 17253008) then
		player:messageSpecial(SIGN_15);
	elseif(npc:getID() == 17253009) or (npc:getID() == 17253010) then
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