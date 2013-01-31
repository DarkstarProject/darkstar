-----------------------------------
-- wooden gate
-- Area: Sacrarium
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getCurrentMission(COP) == THE_SECRETS_OF_WORSHIP and player:getVar("PromathiaStatus") == 2)then
		player:startEvent(0x0006,0,582);
	elseif(player:getCurrentMission(COP) == THE_SECRETS_OF_WORSHIP and player:getVar("PromathiaStatus") == 4 and player:hasKeyItem(RELIQUIARIUM_KEY)==true)then 
		player:startEvent(0x0005);
	elseif(player:hasKeyItem(RELIQUIARIUM_KEY)==true and player:getXPos()>45)then
		player:startEvent(0x006E);
	end
	--RELIQUIARIUM KEY
	return 1;
end;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
	if (csid == 0x0006)then
		player:setVar("PromathiaStatus",3);
	elseif(csid == 0x0005)then
		player:setVar("PromathiaStatus",0);
		player:completeMission(COP,THE_SECRETS_OF_WORSHIP);
		player:addMission(COP,SLANDEROUS_UTTERINGS); 
	end
end;
