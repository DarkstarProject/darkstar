-----------------------------------
-- Area: Davoi
-- NPC:  Hide Flap
-- Involved in Quest: The Doorman
-- @zone 149
-- @pos 293 3 -213
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Davoi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	theDoormanKilledNM = player:getVar("theDoormanKilledNM");
	MyNM = player:getVar("theDoormanMyMob");
	theDoorman = player:getQuestStatus(BASTOK,THE_DOORMAN);
	swordGripMaterial = player:hasKeyItem(SWORD_GRIP_MATERIAL);

	if(theDoorman == QUEST_ACCEPTED) then
		if(theDoormanKilledNM >= 2 and swordGripMaterial == false and MyNM == 1) then
			player:addKeyItem(SWORD_GRIP_MATERIAL);
			player:messageSpecial(KEYITEM_OBTAINED, SWORD_GRIP_MATERIAL);
			player:setVar("theDoormanMyMob",0);
			player:setVar("theDoormanKilledNM",0);
		elseif(swordGripMaterial == true or player:getVar("theDoormanCS") >= 2) then 
			player:messageSpecial(YOU_SEE_NOTHING);
		else
			SpawnMob(17387965):updateEnmity(player); -- Gavotvut
			SpawnMob(17387966):updateEnmity(player); -- Barakbok
			player:setVar("theDoormanMyMob",1);
		end
	else
		player:messageSpecial(YOU_SEE_NOTHING);
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
end;