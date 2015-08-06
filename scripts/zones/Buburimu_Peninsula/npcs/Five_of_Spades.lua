-----------------------------------
--	Area: Buburimu Peninsula
--	NPC:  Five of Spades
--  Invloved in quests: A Greeting Cardian
-----------------------------------
package.loaded["scripts/zones/Buburimu_Peninsula/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Buburimu_Peninsula/TextIDs");
require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local AGreetingCardian = player:getQuestStatus(WINDURST,A_GREETING_CARDIAN);
	local AGCcs = player:getVar("AGreetingCardian_Event");
	
	if (AGreetingCardian == QUEST_ACCEPTED and AGCcs == 4) then
		player:startEvent(0x0001); -- A Greeting Cardian step three
	else player:showText(npc,FIVEOFSPADES_DIALOG); -- Standard Dialog
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
	if (csid == 0x0001) then
		player:setVar("AGreetingCardian_Event",5);
		end
end;



