-----------------------------------
--	Area: Windurst Waters
--	NPC: Tosuka-Porika
--	Involved in Quests: Hat in Hand
--	Working 100%
--  @zone = 238
--  @pos = -26 -6 103
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
require("scripts/zones/Windurst_Walls/TextIDs");
require("scripts/globals/titles");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	function testflag(set,flag)
		return (set % (2*flag) >= flag)
	end
	hatstatus = player:getQuestStatus(WINDURST,HAT_IN_HAND);
	if ((hatstatus == 1  or player:getVar("QuestHatInHand_var2") == 1) and testflag(tonumber(player:getVar("QuestHatInHand_var")),32) == false) then
		player:startEvent(0x0037); -- Show Off Hat
	else
		player:startEvent(0x0172); -- Standard Conversation
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
	if (csid == 0x0037) then  -- Show Off Hat
		player:setVar("QuestHatInHand_var",player:getVar("QuestHatInHand_var")+32);
		player:setVar("QuestHatInHand_count",player:getVar("QuestHatInHand_count")+1);
	end
end;



