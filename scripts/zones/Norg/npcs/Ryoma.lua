-----------------------------------
-- Area: Norg
-- NPC:  Ryoma
-- Involved in Quest: Ayame and Kaede
-- @zone 252
-- @pos -23 0 -9
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if(player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) == QUEST_ACCEPTED) then
		if(player:getVar("AyameAndKaede_Event") == 3) then
			player:startEvent(0x005f);
		else
			player:startEvent(0x005e);
		end
	else
		player:startEvent(0x005e);
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

	if(csid == 0x005f) then
		player:addKeyItem(SEALED_DAGGER);
		player:messageSpecial(KEYITEM_OBTAINED, SEALED_DAGGER);
		player:delKeyItem(STRANGLEY_SHAPED_CORAL);
		player:setVar("AyameAndKaede_Event", 4);
	end
	
end;

