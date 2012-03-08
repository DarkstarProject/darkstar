-----------------------------------
--  Area: Windurst Waters
--  NPC: Hariga-Origa
--  Starts & Finishes Quest: Glyph Hanger
--  @zone: 238
--  @pos: -62.511 -6.499 105.234
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
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

GlyphHanger = player:getQuestStatus(WINDURST,GLYPH_HANGER);

	if (GlyphHanger == QUEST_COMPLETED) then
		player:startEvent(0x0182);
	elseif (GlyphHanger == QUEST_ACCEPTED)
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
		player:delKeyItem(NOTES_FROM_IPUPU);
		player:addKeyItem(MAP_OF_THE_HORUTOTO_RUINS);
		player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_THE_HORUTOTO_RUINS);
		player:addFame(WINDURST,WIN_FAME*120);
		player:completeQuest(WINDURST,GLYPH_HANGER);
	end
end;

