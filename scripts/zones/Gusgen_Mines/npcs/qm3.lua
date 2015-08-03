-----------------------------------
-- Area: Gusgen Mines
-- NPC:  qm3 (???)
-- Involved In Quest: Healing the Land
-- @pos -168 1 311 196
-----------------------------------
package.loaded["scripts/zones/Gusgen_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Gusgen_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local HealingTheLand = player:getQuestStatus(SANDORIA,HEALING_THE_LAND);

	if (HealingTheLand == QUEST_ACCEPTED and player:hasKeyItem(SEAL_OF_BANISHING) == true) then 
		player:delKeyItem(SEAL_OF_BANISHING);
		player:messageSpecial(FOUND_LOCATION_SEAL, SEAL_OF_BANISHING);
	elseif (HealingTheLand == QUEST_ACCEPTED and player:hasKeyItem(SEAL_OF_BANISHING) == false) then 
		player:messageSpecial(IS_ON_THIS_SEAL, SEAL_OF_BANISHING);
	else 
		player:messageSpecial(LETTERS_IS_WRITTEN_HERE);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;




