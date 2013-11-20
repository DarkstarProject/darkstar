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

	if(npc:getID() == 17252992) or (npc:getID() == 17252993) then
		player:messageSpecial(SIGN_1);
	elseif(npc:getID() == 17252994) or (npc:getID() == 17252995) then
		player:messageSpecial(SIGN_3);
	elseif(npc:getID() == 17252996) or (npc:getID() == 17252997) then
		player:messageSpecial(SIGN_5);
	elseif(npc:getID() == 17252998) or (npc:getID() == 17252999) then
		player:messageSpecial(SIGN_7);
	elseif(npc:getID() == 17253000) or (npc:getID() == 17253001) then
		player:messageSpecial(SIGN_9);
	elseif(npc:getID() == 17253002) or (npc:getID() == 17253003) then
		player:messageSpecial(SIGN_11);
	elseif(npc:getID() == 17253004) or (npc:getID() == 17253005) then
		player:messageSpecial(SIGN_13);
	elseif(npc:getID() == 17253006) or (npc:getID() == 17253007) then
		player:messageSpecial(SIGN_15);
	elseif(npc:getID() == 17253008) or (npc:getID() == 17253009) then
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