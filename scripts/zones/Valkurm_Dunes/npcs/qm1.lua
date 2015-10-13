-----------------------------------
-- Area: Valkurm Dunes
-- NPC:  qm1 (???)
-- Involved In Quest: An Empty Vessel
-- @pos 238.524 2.661 -148.784 103
-----------------------------------
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Valkurm_Dunes/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:getFreeSlotsCount() > 0 and player:hasItem(503) == false) then
		player:addItem(503);
		player:messageSpecial(ITEM_OBTAINED,503);
	else
		player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,503);
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