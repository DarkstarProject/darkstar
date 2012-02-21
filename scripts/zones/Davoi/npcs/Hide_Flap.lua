-----------------------------------
-- Area: Davoi
-- NPC:  Hide Flap
-- Involved in Quest: The Doorman, The First Meeting
-- @zone 149
-- @pos 293 3 -213 (WAR)(K-9) @pos -124 3 -43 (MNK)(F-7)
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
	
	X = npc:getXPos();
	Z = npc:getZPos();
	
	swordGripMaterial = player:hasKeyItem(SWORD_GRIP_MATERIAL);
	martialArtsScroll = player:hasKeyItem(SANDORIAN_MARTIAL_ARTS_SCROLL);
	
	if(player:getQuestStatus(BASTOK,THE_DOORMAN) == QUEST_ACCEPTED and X >= 289 and X <= 293 and Z <= -214 and Z >= -218) then
		if(player:getVar("theDoormanKilledNM") >= 2 and swordGripMaterial == false and player:getVar("theDoormanMyMob") == 1) then
			player:addKeyItem(SWORD_GRIP_MATERIAL);
			player:messageSpecial(KEYITEM_OBTAINED, SWORD_GRIP_MATERIAL);
			player:setVar("theDoormanMyMob",0);
			player:setVar("theDoormanKilledNM",0);
		elseif(swordGripMaterial == true or player:getVar("theDoormanCS") >= 2) then 
			player:messageSpecial(YOU_SEE_NOTHING);
		else
			SpawnMob(17387965,300):updateEnmity(player); -- Gavotvut
			SpawnMob(17387966,300):updateEnmity(player); -- Barakbok
			player:setVar("theDoormanMyMob",1);
		end
	elseif(player:getQuestStatus(BASTOK,THE_FIRST_MEETING) == QUEST_ACCEPTED and martialArtsScroll == false and X <= -122 and X >= -126 and Z <= -41 and Z >= -45) then
		if(player:getVar("theFirstMeetingKilledNM") >= 2) then
			player:addKeyItem(SANDORIAN_MARTIAL_ARTS_SCROLL);
			player:messageSpecial(KEYITEM_OBTAINED,SANDORIAN_MARTIAL_ARTS_SCROLL);
			player:setVar("theFirstMeetingKilledNM",0);
		else
			SpawnMob(17387967,300):updateEnmity(player); -- Bilopdop
			SpawnMob(17387968,300):updateEnmity(player); -- Deloknok
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