-----------------------------------
--  Area: Maze of Shakhrami
--  NPC:  Ahko Mhalijikhari
--  Type: Quest NPC
--  @pos -344.617 -12.226 -166.233 198
--  0x003d  0x003e  0x003f  0x0040  0x0041
-----------------------------------
package.loaded["scripts/zones/Maze_of_Shakhrami/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Maze_of_Shakhrami/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	--player:startEvent(0x0040);
	if (player:getQuestStatus(WINDURST,ECO_WARRIOR_WIN) ~= QUEST_AVAILABLE and player:getVar("ECO_WARRIOR_ACTIVE") == 238) then
		
		if (player:hasKeyItem(INDIGESTED_MEAT)) then
			player:startEvent(0x0041); -- After NM's dead
		elseif (player:hasStatusEffect(EFFECT_LEVEL_RESTRICTION) == false) then
			player:startEvent(0x003e); -- 
		else
			player:startEvent(0x0040);
		end
	else
		player:startEvent(0x003d); -- default
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
	 printf("RESULT: %u",option);
	if (csid == 0x003e and option == 1) then
		player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,20,0,0);
	elseif (csid == 0x0041) then
		player:setVar("ECOR_WAR_WIN-NMs_killed",0);
		player:delStatusEffect(EFFECT_LEVEL_RESTRICTION);
	elseif (csid == 0x0040) then
		player:delStatusEffect(EFFECT_LEVEL_RESTRICTION);
	end
end;

