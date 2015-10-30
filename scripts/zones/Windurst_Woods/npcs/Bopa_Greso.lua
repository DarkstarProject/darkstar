-----------------------------------
--  Area: Windurst Woods
--   NPC: Bopa Greso
--  Type: Standard NPC
-- @zone: 241
--  @pos 59.773 -6.249 216.766
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	thickAsThieves = player:getQuestStatus(WINDURST,AS_THICK_AS_THIEVES);
	thickAsThievesCS = player:getVar("thickAsThievesCS");
	
	if (thickAsThieves == QUEST_ACCEPTED) then
		player:startEvent(0x01FA);
			if (thickAsThievesCS == 1) then
				player:setVar("thickAsThievesCS",2);
			elseif (thickAsThievesCS == 3) then
				player:setVar("thickAsThievesCS",4);
				rand1 = math.random(2,7);
				player:setVar("thickAsThievesGrapplingCS",rand1);
				player:setVar("thickAsThievesGamblingCS",1);
			end
	else
		player:startEvent(0x004d); -- standard cs
	end
	
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
end;

