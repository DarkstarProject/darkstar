-----------------------------------
-- Area: Metalworks
-- NPC: Alois
-- Involved in Missions
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)


	if (player:getCurrentMission(1) == 4) then
		count = trade:getItemCount();
		gil = trade:getGil();

		if (trade:hasItemQty(LIZARD_EGG,1) and count == 1 and gil == 0) then
			if (player:hasCompletedMission(1,4) == 0) then
				player:startEvent(0x0174);
			else
				player:startEvent(0x0175);
			end
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x0172);
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

	if (csid == 0x0174) then
		player:completeMission(1);
		player:tradeComplete();
		player:addRankPoints(10);
	elseif (csid == 0x0175) then
		player:tradeComplete();
		player:addRankPoints(10);
	end
end;

