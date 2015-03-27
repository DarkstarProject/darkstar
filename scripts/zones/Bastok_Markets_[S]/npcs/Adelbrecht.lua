-----------------------------------
-- Area: Bastok Markets (S)
-- NPC: Adelbrecht
-- Starts Quests: The Fighting Fourth
-- Involved in Missions: Back to the Beginning
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets_[S]/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Markets_[S]/TextIDs");
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

	if (player:getCurrentMission(WOTG) == BACK_TO_THE_BEGINNING and player:getVar("WotgStatus")==12 and player:hasKeyItem(922) ==true) then
		player:startEvent(0x008b,0,922);--WOTG event
	elseif(player:getCurrentMission(WOTG) == BACK_TO_THE_BEGINNING and player:getVar("WotgStatus")==13 and player:hasKeyItem(922) ==true and player:hasKeyItem(917)) then
		player:startEvent(0x008c,0,917)
	end
end;


-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

		if(csid == 0x008b and option == 1) then
			player:addKeyItem(BATTLE_RATIONS);
			player:messageSpecial(KEYITEM_OBTAINED,BATTLE_RATIONS);
			player:addQuest(CRYSTAL_WAR, THE_FIGHTING_FOURTH);
			player:setVar("WotgStatus",13);
		elseif (csid == 0x008c and option == 1) then
			player:delKeyItem(BATTLE_RATIONS);
			player:delQuest(CRYSTAL_WAR, THE_FIGHTING_FOURTH);
			player:setVar("WotgStatus",12);
		end
end;
