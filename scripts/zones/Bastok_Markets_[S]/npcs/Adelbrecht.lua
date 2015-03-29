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

	if (player:getCurrentMission(WOTG) == BACK_TO_THE_BEGINNING and player:getVar("WotgStatus") == 12 and player:hasKeyItem(922) == true) then
		player:startEvent(0x008B,0,922);--WOTG event
	elseif(player:getCurrentMission(WOTG) == BACK_TO_THE_BEGINNING and player:getVar("WotgStatus") == 13 and player:hasKeyItem(922) == true and player:hasKeyItem(917)) then
		player:startEvent(0x008C,0,917)
	elseif(player:getCurrentMission(WOTG) == BACK_TO_THE_BEGINNING and player:getVar("WotgStatus") == 13 and player:hasKeyItem(922) == true and player:getVar("THE_FIGHTING_FOURTH") == 1) then
		player:startEvent(0x008D)
	elseif(player:getCurrentMission(WOTG) == BACK_TO_THE_BEGINNING and player:getVar("WotgStatus") == 13 and player:hasKeyItem(922) == true and player:getVar("THE_FIGHTING_FOURTH") == 2) then
		player:startEvent(0x008E)
	elseif(player:getVar("THE_FIGHTING_FOURTH") == 3) then
		player:startEvent(0x008F)
	end
end;


-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

		if(csid == 0x008B and option == 1 and player:getVar("WotgStatus") == 12) then
			player:addKeyItem(BATTLE_RATIONS);
			player:messageSpecial(KEYITEM_OBTAINED,BATTLE_RATIONS);
			player:addQuest(CRYSTAL_WAR, THE_FIGHTING_FOURTH);
			player:setVar("WotgStatus",13);
		elseif (csid == 0x008C or csid == 0x008D or csid == 0x008E and option == 1 and player:getVar("WotgStatus") == 12) then
			player:delKeyItem(BATTLE_RATIONS);
			player:delQuest(CRYSTAL_WAR, THE_FIGHTING_FOURTH);
			player:setVar("WotgStatus",12);
		elseif (csid == 0x008F and player:getCurrentMission(WOTG) == BACK_TO_THE_BEGINNING and player:getVar("THE_FIGHTING_FOURTH") == 3) then
			if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15754);
			else
				player:addItem(15754);
				player:addKeyItem(BRONZE_RIBBON_OF_SERVICE);
				player:addTitle(FOURTH_DIVISION_SOLDIER);
				player:messageSpecial(KEYITEM_OBTAINED,BRONZE_RIBBON_OF_SERVICE);
				player:setVar("THE_FIGHTING_FOURTH",4);
				player:setVar("Campaign_Nation",2);
				player:setVar("WotgStatus",14);
				player:delQuest(CRYSTAL_WAR, THE_FIGHTING_FOURTH);
			end
		end
end;
