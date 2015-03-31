-----------------------------------
-- Area: Bastok Markets (S)
-- NPC: Adelbrecht
-- Starts Quests: The Fighting Fourth
-- Involved in Missions: Back to the Beginning
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets_[S]/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/settings");
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
    local Allegiance = player:getCampaignAllegiance();
    -- 0 = none, 1 = San d'Oria Iron Rams, 2 = Bastok Fighting Fourth, 3 = Windurst Cobras

    local TheFightingFourth = player:getQuestStatus(CRYSTAL_WAR,THE_FIGHTING_FOURTH);
    local SnakeOnThePlains = player:getQuestStatus(CRYSTAL_WAR,SNAKE_ON_THE_PLAINS);
    local SteamedRams = player:getQuestStatus(CRYSTAL_WAR,STEAMED_RAMS);
    local BlueLetter = player:hasKeyItem(BLUE_RECOMMENDATION_LETTER);
    local CharredPropeller = player:hasKeyItem(BATTLE_RATIONS);
    
--    if (SteamedRams == QUEST_ACCEPTED or SnakeOnThePlains == QUEST_ACCEPTED) then
--        player:startEvent(0x009);
--    elseif (SteamedRams == QUEST_AVAILABLE and RedLetter == true) then
    if (TheFightingFourth == QUEST_AVAILABLE and BlueLetter == true) then
        player:startEvent(0x008B);
--    elseif (SteamedRams == QUEST_AVAILABLE and player:getVar("Used_RED_RECOMMENDATION_LETTER") == 1) then
--        player:startEvent(0x008);
    elseif (SteamedRams == QUEST_ACCEPTED and CharredPropeller == true and OxidizedPlate == true and ShatteredLumber == true) then
        player:startEvent(0x00C);
    elseif (SteamedRams == QUEST_ACCEPTED) then
        player:startEvent(0x00D);
    elseif (SteamedRams == QUEST_COMPLETED and Allegiance == 1) then
        player:startEvent(0x005);
    else
        player:startEvent(0x00F);
    end
end;

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
			if (player:getVar("Campaign_Nation") == 0) then
            	elseif (csid == 0x00C and option == 0) then
        		-- Is first join, so add Sprinter's Shoes and bronze medal
			if (player:getVar("Campaign_Nation") == 0) then
            			if (player:getFreeSlotsCount() >= 1) then
                			player:setCampaignAllegiance(2);
                			player:addTitle(FOURTH_DIVISION_SOLDIER);
                			player:addKeyItem(BRONZE_RIBBON_OF_SERVICE);
                			player:addItem(15754);
                			player:completeQuest(CRYSTAL_WAR,THE_FIGHTING_FOURTH);
                			player:messageSpecial(KEYITEM_OBTAINED, BRONZE_RIBBON_OF_SERVICE);
                			player:messageSpecial(ITEM_OBTAINED, 15754);
        			else
                			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 15754);
            			end
                
end;
