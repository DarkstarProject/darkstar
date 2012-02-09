-----------------------------------
--	Area: Mhaura
--	NPC:  Take
--	Working 100% 
--  Involved In Quest: RYCHARDE_THE_CHEF
-----------------------------------

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

RychardetheChef = player:getQuestStatus(OTHER_AREAS,RYCHARDE_THE_CHEF);


if (RychardetheChef==QUEST_AVAILABLE) then -- if available and allready talked to mayor assistant
	QuestStatus=player:getVar("QuestRychardetheChef_var"); 
	if (QuestStatus == 1) then
		player:setVar("QuestRychardetheChef_var",2); -- second stage on quest
		player:startEvent(0x3c); -- tell to look for ricarde
	else
		player:startEvent(0x3b); -- talk abaout something else
	end;
else
	player:startEvent(0x3b); -- talk abaout something else	
end;

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



