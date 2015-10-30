-----------------------------------
-- Area: North Gustaberg
-- NPC: qm2 (???)
-- Involved in Quest "As Thick As Thieves"
-- @pos -232.924 99.107 442.990 106
-----------------------------------
package.loaded["scripts/zones/North_Gustaberg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/quests");
require("scripts/zones/North_Gustaberg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local thickAsThievesGamblingCS = player:getVar("thickAsThievesGamblingCS");
	
	if (thickAsThievesGamblingCS == 5) then
		SpawnMob(17211848,120):updateClaim(player);
	elseif (thickAsThievesGamblingCS == 6) then
		player:startEvent(0x00c8,1092);
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

	if (csid == 0x00c8) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1092);
		else 
			player:addItem(1092);
			player:messageSpecial(ITEM_OBTAINED,1092);
			player:setVar("thickAsThievesGamblingCS",7);
		end
	end

end;