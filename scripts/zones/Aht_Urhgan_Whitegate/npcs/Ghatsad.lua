-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Ghatsad
-- Standard Info NPC
-- Involved in quest: No String Attached
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

local NoStringsAttached = player:getQuestStatus(AHT_URHGAN,NO_STRINGS_ATTACHED);
local NoStringsAttachedProgress = player:getVar("NoStringsAttachedProgress");
local Automaton = player:hasKeyItem(798);
local CreationStarted_Day = player:getVar("CreationStarted_Day");
local currentDay = VanadielDayOfTheYear();
local CreationReady = ((CreationStarted_Day < currentDay) or (CreationStarted_Day > currentDay and player:getVar("CreationStarted_Year") < VanadielYear()));
	if (NoStringsAttached == 1 and NoStringsAttachedProgress == 2) then
		player:startEvent(0x0106); -- he want you to go to Arrapago
	elseif (NoStringsAttached == 1 and NoStringsAttachedProgress == 3) then
		player:startEvent(0x0107); -- reminder to go to Arrapago
	elseif (NoStringsAttached == 1 and NoStringsAttachedProgress == 4 and Automaton == true) then
		player:startEvent(0x0108); -- you give the antique automaton to him and need to wait a gameday
	elseif (NoStringsAttached == 1 and NoStringsAttachedProgress == 5 and CreationReady == true) then
		player:startEvent(0x0109); -- you go back for your automaton
	else
		player:startEvent(0x0100);
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

	if (csid == 0x0106) then
		player:setVar("NoStringsAttachedProgress",3);
	elseif (csid == 0x0108) then
		player:setVar("CreationStarted_Day",VanadielDayOfTheYear());
		player:setVar("CreationStarted_Year",VanadielYear());
		player:setVar("NoStringsAttachedProgress",5);
		player:delKeyItem(798);
	elseif (csid == 0x0109) then
		player:setVar("NoStringsAttachedProgress",6);
		player:setVar("CreationStarted_Day",0);
		player:setVar("CreationStarted_Year",0);
	end;
end;



