-----------------------------------
-- Area: Davoi
-- NPC:  ??? (qm3)
-- Involved in Quest: True will
-- @pos 
-----------------------------------
package.loaded["scripts/zones/Yhoator_Jungle/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Yhoator_Jungle/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getQuestStatus(OUTLANDS,TRUE_WILL) == QUEST_ACCEPTED and player:hasKeyItem(OLD_TRICK_BOX) == false) then
		if(player:getVar("trueWillKilledNM") >= 1) then
			player:addKeyItem(OLD_TRICK_BOX);
			player:messageSpecial(KEYITEM_OBTAINED,OLD_TRICK_BOX);
			player:setVar("trueWillKilledNM",0);
		else
			SpawnMob(17285544,150):updateEnmity(player); -- Kappa Akuso
			SpawnMob(17285545,300):updateEnmity(player); -- Kappa Bonze
			SpawnMob(17285546,150):updateEnmity(player); -- Kappa Biwa
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