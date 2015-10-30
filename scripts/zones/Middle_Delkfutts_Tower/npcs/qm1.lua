-----------------------------------
-- Area: Middle Delfutt's Tower
-- NPC:  ??? (qm1)
-- Involved In Quest: Blade of Evil
-- @pos 84 -79 77 157
-----------------------------------
package.loaded["scripts/zones/Middle_Delkfutts_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Middle_Delkfutts_Tower/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (player:getQuestStatus(BASTOK,BLADE_OF_EVIL) == QUEST_ACCEPTED and player:getVar("bladeOfEvilCS") == 0) then
		if (trade:hasItemQty(1114,1) and trade:getItemCount() == 1) then -- Trade Quadav Mage Blood
			player:tradeComplete();
			SpawnMob(17420629,300):updateClaim(player);
			SpawnMob(17420630,180):updateClaim(player);
			SpawnMob(17420631,180):updateClaim(player);
		end
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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