-----------------------------------
--  Area: Windurst Woods
--   NPC: Ibwam
--  Type: Warp NPC
-- @zone: 241
--  @pos: -25.655 1.749 -60.651
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/globals/teleports");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (player:hasCompletedMission(TOAU,PRESIDENT_SALAHEEM) and player:hasCompleteQuest(WINDURST,LURE_OF_THE_WILDCAT_WINDURST)) then
		if (trade:getItemCount() == 1 and trade:getGil() == 300) then
			player:startEvent(0x031a);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x02e0);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
	if (csid == 0x031a) then
		player:tradeComplete();
		toAhtUrhganWhitegate(player);
	end
end;