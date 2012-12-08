-----------------------------------
--  Area: Windurst Woods
--   NPC: Cha Lebagta
--  Type: Standard NPC
-- @zone: 241
--  @pos: 58.385 -6.249 216.670
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
	
	if(thickAsThieves == QUEST_ACCEPTED) then
		player:startEvent(0x01FB,0,17474);
			if (thickAsThievesCS == 1) then
				player:setVar("thickAsThievesCS",3);
			elseif (thickAsThievesCS == 2) then
				player:setVar("thickAsThievesCS",4);
				rand1 = math.random(2,7);
				player:setVar("thickAsThievesGrapplingCS",rand1);
				player:setVar("thickAsThievesGamblingCS",1);				
			end
	else
		player:startEvent(0x004e); -- standard cs
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

