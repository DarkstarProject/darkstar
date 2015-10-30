-----------------------------------
--  Area: Windurst Waters
--  NPC:  Hariga-Origa
--  Starts & Finishes Quest: Glyph Hanger
--  Involved in Mission 2-1
--  @pos -62 -6 105 238
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	smudgeStatus = player:getQuestStatus(WINDURST,A_SMUDGE_ON_ONE_S_RECORD);
	
	if (smudgeStatus == QUEST_ACCEPTED and trade:hasItemQty(637,1) and trade:hasItemQty(4382,1)) then
		player:startEvent(0x01a1,3000);
	end
		
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	GlyphHanger = player:getQuestStatus(WINDURST,GLYPH_HANGER);
	chasingStatus = player:getQuestStatus(WINDURST,CHASING_TALES);
	smudgeStatus = player:getQuestStatus(WINDURST,A_SMUDGE_ON_ONE_S_RECORD);
	Fame = player:getFameLevel(WINDURST);

	if (smudgeStatus == QUEST_COMPLETED and player:needToZone() == true) then
		player:startEvent(0x01a2);
	elseif (smudgeStatus == QUEST_ACCEPTED) then
		player:startEvent(0x019e,0,637,4382);
    elseif (smudgeStatus == QUEST_AVAILABLE and chasingStatus == QUEST_COMPLETED and Fame >= 4) then
		player:startEvent(0x019d,0,637,4382);
	elseif (GlyphHanger == QUEST_COMPLETED and chasingStatus ~= QUEST_COMPLETED) then
		player:startEvent(0x0182);
	elseif (GlyphHanger == QUEST_ACCEPTED) then
		if (player:hasKeyItem(NOTES_FROM_IPUPU)) then
			player:startEvent(0x0181);
		else 
			player:startEvent(0x017e);
		end
	elseif (GlyphHanger == QUEST_AVAILABLE) then
		player:startEvent(0x017d);
	
	else
		player:startEvent(0x0174); -- The line will never be executed
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
-- printf("RESULT: %u",option);

	if (csid == 0x017d and option == 0) then
		player:addQuest(WINDURST,GLYPH_HANGER);
		player:addKeyItem(NOTES_FROM_HARIGAORIGA);
		player:messageSpecial(KEYITEM_OBTAINED,NOTES_FROM_HARIGAORIGA);
	elseif (csid == 0x0181) then
		player:needToZone(true);
		player:delKeyItem(NOTES_FROM_IPUPU);
		if (player:hasKeyItem(MAP_OF_THE_HORUTOTO_RUINS) == false) then
			player:addKeyItem(MAP_OF_THE_HORUTOTO_RUINS);
			player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_THE_HORUTOTO_RUINS);
		end
		player:addFame(WINDURST,WIN_FAME*120);
		player:completeQuest(WINDURST,GLYPH_HANGER);
	elseif (csid == 0x019d and option == 0) then
		player:addQuest(WINDURST,A_SMUDGE_ON_ONE_S_RECORD);
	elseif (csid == 0x01a1) then
		player:needToZone(true);
		player:addGil(GIL_RATE*3000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*3000);
		if (player:hasKeyItem(MAP_OF_FEIYIN) == false) then
			player:addKeyItem(MAP_OF_FEIYIN);
			player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_FEIYIN);
		end
		player:addFame(WINDURST,WIN_FAME*120);
		player:completeQuest(WINDURST,A_SMUDGE_ON_ONE_S_RECORD);	
	end
	
end;