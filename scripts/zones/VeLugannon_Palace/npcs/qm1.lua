-----------------------------------
-- Area: VeLugannon Palace
-- NPC:  ???
-- @pos -370.039 16.014 -274.378 177
-----------------------------------
package.loaded["scripts/zones/VeLugannon_Palace/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/VeLugannon_Palace/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	respawn = GetServerVariable("[TEMP]Respawn_qm1_for_curtana");
	
	if(player:hasItem(16575) == false and player:getFreeSlotsCount() >= 1 and respawn <= os.time(t)) then
		player:addItem(16575);
		player:messageSpecial(ITEM_OBTAINED,16575); -- Curtana
		SetServerVariable("[TEMP]Respawn_qm1_for_curtana",os.time(t) + 7200); -- 2 hours
		-- ??? dissapears for 2 hours and reappears on new position
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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