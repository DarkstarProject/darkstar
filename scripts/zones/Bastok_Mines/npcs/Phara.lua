-----------------------------------
-- Area: Bastok Mines
-- NPC: Phara
-- Standard Info NPC
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

Door = player:getQuestStatus(BASTOK,THE_DOORMAN);
DoorVar = player:getVar("Doorman");

	if (Door ==0 and player:getMainJob() ==1 and player:getMainLvl() >=40) then
	--Doorman WAR AF Weapon Quest
		player:startEvent(0x0097);
	--Doorman Key Item
		elseif (player:hasKeyItem(SWORD_GRIP_MATERIAL)) then
		player:startEvent(0x0098);
	--the doorman notification, go to naji
		elseif (DoorVar == 2) then
		player:startEvent(0x0099);
	--Lead in to Talekeeper's Truth
		elseif (Door ==2 and player:getMainJob() ==1 and player:getMainLvl() >=50) then
		player:startEvent(0x009a);
	--Default text
		else
		player:startEvent(0x0096);
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

	if (csid == 0x0097) then
		player:addQuest(BASTOK,THE_DOORMAN);
		player:setVar("Doorman",1);
	elseif (csid == 0x0098) then
--		setVar("Time", os.time() + 3456); -- wait for 24 hrs
--		if getVar("Time") <= os.time() then  -- etc
		player:setVar("Doorman",2);
		player:delKeyItem(SWORD_GRIP_MATERIAL);
	elseif (csid == 0x0099) then
		player:addKeyItem(YASINS_SWORD);
		player:messageSpecial(6381,YASINS_SWORD);
		player:setVar("Doorman",3);
	else
	end;




--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;



