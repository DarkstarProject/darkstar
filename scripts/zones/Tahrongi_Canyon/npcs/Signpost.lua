-----------------------------------
-- Area: Tahrongi Canyon
-- NPC:  Signpost
-----------------------------------
package.loaded["scripts/zones/Tahrongi_Canyon/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Tahrongi_Canyon/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (npc:getID() == 17257026) or (npc:getID() == 17257026) then
		player:messageSpecial(SIGN_1);		
	elseif (npc:getID() == 17257027) or (npc:getID() == 17257028) then
		player:messageSpecial(SIGN_3);
	elseif (npc:getID() == 17257031) or (npc:getID() == 17257032) then
		player:messageSpecial(SIGN_5);
	elseif (npc:getID() == 17257033) or (npc:getID() == 17257034) then
		player:messageSpecial(SIGN_7);	
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