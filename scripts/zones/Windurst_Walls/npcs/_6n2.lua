-----------------------------------
-- Area: Windurst Walls
-- Door: House of the Hero
-- Involved in Mission 2-1
-- Involved In Quest: Know One's Onions, Onion Rings, The Puppet Master, Class Reunion
-- @pos -26 -13 260 239
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Windurst_Walls/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local ThePuppetMaster = player:getQuestStatus(WINDURST,THE_PUPPET_MASTER);
	local ClassReunion = player:getQuestStatus(WINDURST,CLASS_REUNION);
	local CarbuncleDebacle = player:getQuestStatus(WINDURST,CARBUNCLE_DEBACLE);
	-- Check for Missions first (priority?)
	if (player:getCurrentMission(WINDURST) == LOST_FOR_WORDS and player:getVar("MissionStatus") == 5) then
		player:startEvent(0x0151);
	else
		----------------------------------------------------
		-- Carbuncle Debacle
		if (player:getMainLvl() >= AF2_QUEST_LEVEL and player:getMainJob() == 15 and ClassReunion == QUEST_COMPLETED and CarbuncleDebacle == QUEST_AVAILABLE and player:needToZone() == false) then
			player:startEvent(0x019f); -- Carby begs for your help
		----------------------------------------------------
		-- Class Reunion
		elseif (player:getMainLvl() >= AF2_QUEST_LEVEL and player:getMainJob() == 15 and ThePuppetMaster == QUEST_COMPLETED and ClassReunion == QUEST_AVAILABLE and player:needToZone() == false) then
			player:startEvent(0x019d); -- Carby asks for your help again.
		----------------------------------------------------
		-- The Puppet Master
		elseif (player:getMainLvl() >= AF1_QUEST_LEVEL and player:getMainJob() == 15 and ThePuppetMaster ~= QUEST_ACCEPTED and player:needToZone() == false and ClassReunion ~= QUEST_ACCEPTED and CarbuncleDebacle ~= QUEST_ACCEPTED) then -- you need to be on SMN as well to repeat the quest
			player:startEvent(0x0192); -- Carby asks for your help, visit Juroro
		elseif (player:getQuestStatus(WINDURST,THE_PUPPET_MASTER) == QUEST_ACCEPTED and player:getVar("ThePuppetMasterProgress") == 1) then
			player:startEvent(0x0193); -- reminder to visit Juroro
		----------------------------------------------------
		elseif (player:hasKeyItem(JOKER_CARD)) then
			player:startEvent(0x0183,0,JOKER_CARD);
		elseif (player:getVar("WildCard") == 1) then
			player:startEvent(0x0182);
		elseif (player:getVar("OnionRings") == 1) then
			player:startEvent(0x0121);
		elseif (player:getVar("KnowOnesOnions") == 1) then
			player:startEvent(0x0120,0,4387);
		elseif (player:getQuestStatus(WINDURST,I_CAN_HEAR_A_RAINBOW) == QUEST_AVAILABLE and player:getMainLvl() >= 30 and player:hasItem(1125)) then
			player:startEvent(0x0180,1125,1125,1125,1125,1125,1125,1125,1125);
		elseif (player:getQuestStatus(WINDURST,I_CAN_HEAR_A_RAINBOW) == QUEST_ACCEPTED) then
			player:startEvent(0x0181,1125,1125,1125,1125,1125,1125,1125,1125);
		else
			player:messageSpecial(7532); -- "The doors are firmly sealed shut."
		end;
	end;

	return 1;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID2: %u",csid);
	-- printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);

	if (csid == 0x0120) then
		player:setVar("KnowOnesOnions",2);
	elseif (csid == 0x0121) then
		player:completeQuest(WINDURST,ONION_RINGS);
		player:addFame(WINDURST,WIN_FAME*100);
		player:addTitle(STAR_ONION_BRIGADIER);
		player:delKeyItem(OLD_RING);
		player:setVar("OnionRingsTime",0);
		player:setVar("OnionRings",2);
	elseif (csid == 0x0180) then
		player:addQuest(WINDURST, I_CAN_HEAR_A_RAINBOW);
	elseif (csid == 0x0182) then
		player:setVar("WildCard",2);
	elseif (csid == 0x0183) then
		player:delKeyItem(JOKER_CARD);
		player:addGil(GIL_RATE*8000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*8000);
	elseif (csid == 0x0151) then
		-- Mark the progress
		player:setVar("MissionStatus",6);
	elseif (csid == 0x0192) then
		if (player:getQuestStatus(WINDURST,THE_PUPPET_MASTER) == QUEST_COMPLETED) then
			player:delQuest(WINDURST,THE_PUPPET_MASTER);
			player:addQuest(WINDURST,THE_PUPPET_MASTER); -- this needs only if you repeat this quest
		end;
		player:setVar("ThePuppetMasterProgress",1);
		player:addQuest(WINDURST,THE_PUPPET_MASTER);
	elseif (csid == 0x019d) then
		player:setVar("ClassReunionProgress",1);
		player:addQuest(WINDURST,CLASS_REUNION);
		player:addKeyItem(CARBUNCLES_TEAR);
		player:messageSpecial(KEYITEM_OBTAINED,CARBUNCLES_TEAR);
	elseif (csid == 0x019f) then
		player:addQuest(WINDURST,CARBUNCLE_DEBACLE);
		player:setVar("CarbuncleDebacleProgress",1);
	end;

end;
