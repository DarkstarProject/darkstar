-----------------------------------
-- Area: Metalworks
--  NPC: Naji
-- Involved in Quests: The doorman (finish), Riding on the Clouds
-- Involved in Mission: Bastok 6-2
-- !pos 64 -14 -4 237
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/missions");
local ID = require("scripts/zones/Metalworks/IDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_2") == 6) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_2",0);
            player:tradeComplete();
            player:addKeyItem(dsp.ki.SMILING_STONE);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SMILING_STONE);
        end
    end

end;


function onTrigger(player,npc)
    TrustSandoria = player:getQuestStatus(SANDORIA,TRUST_SANDORIA);
	TrustBastok   = player:getQuestStatus(BASTOK,TRUST_BASTOK);
	TrustWindurst = player:getQuestStatus(WINDURST,TRUST_WINDURST);
	local Level = player:getMainLvl();
	local rank3 = player:getRank(BASTOK) >= 3 and 1 or player:getRank(SANDORIA) >= 3 and 1 or player:getRank(WINDURST) >= 3 and 1 or 0;

	--TRUST
	if (Level >= 5 and TrustBastok == QUEST_ACCEPTED and (TrustSandoria == QUEST_COMPLETED or TrustWindurst == QUEST_COMPLETED)) then
		if (player:hasKeyItem(dsp.keyItem.BLUE_INSTITUTE_CARD) == true and player:hasSpell(dsp.trust.NAJI) == false) then
			player:startEvent(984,0,0,0,TrustMemory(player),0,0,0,rank3);	
		end
	elseif (Level >= 5 and TrustBastok == QUEST_ACCEPTED) then
		if (player:hasKeyItem(dsp.keyItem.BLUE_INSTITUTE_CARD) == true and player:hasSpell(dsp.trust.NAJI) == false) then
			player:startEvent(980,0,0,0,TrustMemory(player),0,0,0,rank3);	
		elseif (player:hasSpell(dsp.trust.NAJI) == true and player:getVar("BastokFirstTrust") == 1) then
			player:startEvent(981);
		elseif (player:getVar("BastokFirstTrust") == 2) then
			player:startEvent(982);
		end
		
		
    elseif (player:hasKeyItem(dsp.ki.YASINS_SWORD)) then -- The Doorman, WAR AF1
        player:startEvent(750);
    elseif (player:getCurrentMission(BASTOK) ~= 255) then
        local currentMission = player:getCurrentMission(BASTOK);

        if (currentMission == THE_ZERUHN_REPORT and player:hasKeyItem(dsp.ki.ZERUHN_REPORT)) then
            if (player:seenKeyItem(dsp.ki.ZERUHN_REPORT)) then
                player:startEvent(710,0);
            else
                player:startEvent(710,1);
            end
        elseif (currentMission == THE_CRYSTAL_LINE and player:hasKeyItem(dsp.ki.C_L_REPORTS)) then
            player:startEvent(711);
        elseif (currentMission == THE_EMISSARY and player:hasKeyItem(dsp.ki.KINDRED_REPORT)) then
            player:startEvent(714);
        elseif (currentMission == THE_EMISSARY) then
            if (player:hasKeyItem(dsp.ki.LETTER_TO_THE_CONSULS_BASTOK) == false and player:getVar("MissionStatus") == 0) then
                player:startEvent(713);
            else
                player:showText(npc,ID.text.GOOD_LUCK);
            end
        elseif (player:hasKeyItem(dsp.ki.MESSAGE_TO_JEUNO_BASTOK) and player:getVar("MissionStatus") == 0) then
            player:startEvent(720);
        elseif (currentMission == DARKNESS_RISING and player:getVar("MissionStatus") == 1) then
            player:startEvent(721);
        elseif (player:hasKeyItem(dsp.ki.BURNT_SEAL)) then
            player:startEvent(722);
        elseif (currentMission == THE_PIRATE_S_COVE and player:getVar("MissionStatus") == 0) then
            player:startEvent(761);
        elseif (currentMission == THE_PIRATE_S_COVE and player:getVar("MissionStatus") == 3) then
            player:startEvent(762);
        else
            player:startEvent(700);
        end
    elseif (player:hasKeyItem(dsp.ki.YASINS_SWORD)) then -- The Doorman
        player:startEvent(750);
		
	--TRUST END	
	elseif(TrustBastok == QUEST_COMPLETED and player:hasSpell(dsp.trust.AYAME) == false) then
		player:startEvent(983,0,0,0,0,0,0,0,rank3);	
    else
        player:startEvent(700);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 750) then
        if (player:getFreeSlotsCount(0) >= 1) then
            player:addItem(16678);
            player:messageSpecial(ID.text.ITEM_OBTAINED, 16678); -- Razor Axe
            player:delKeyItem(dsp.ki.YASINS_SWORD);
            player:setVar("theDoormanCS",0);
            player:addFame(BASTOK,30);
            player:completeQuest(BASTOK,THE_DOORMAN);
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 16678); -- Razor Axe
        end
    elseif (csid == 710) then
        player:delKeyItem(dsp.ki.ZERUHN_REPORT);
        player:completeMission(BASTOK,THE_ZERUHN_REPORT);
    elseif (csid == 713) then
        player:addKeyItem(dsp.ki.LETTER_TO_THE_CONSULS_BASTOK);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.LETTER_TO_THE_CONSULS_BASTOK);
        player:setVar("MissionStatus",1);
    elseif (csid == 720 and option == 0 or csid == 721) then
        player:delKeyItem(dsp.ki.MESSAGE_TO_JEUNO_BASTOK);
        player:addKeyItem(dsp.ki.NEW_FEIYIN_SEAL);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.NEW_FEIYIN_SEAL);
        player:setVar("MissionStatus",10);
    elseif (csid == 720 and option == 1) then
        player:delKeyItem(dsp.ki.MESSAGE_TO_JEUNO_BASTOK);
        player:setVar("MissionStatus",1);
    elseif (csid == 761) then
        player:setVar("MissionStatus",1);
    elseif (csid == 714 or csid == 722 or csid == 762) then
        finishMissionTimeline(player,1,csid,option);
		
	--TRUST	
	elseif (csid == 980) then
		player:addSpell(dsp.trust.NAJI, true);
		player:addVar("BastokFirstTrust", 1);
		player:PrintToPlayer("You learned Trust: Naji!", 0xD);
	elseif (csid == 982) then
		player:messageSpecial(ID.text.KEYITEM_LOST,dsp.keyItem.BLUE_INSTITUTE_CARD);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.keyItem.BASTOK_TRUST_PERMIT);
		player:setVar("BastokFirstTrust", 0);
		player:addTitle(dsp.title.THE_TRUSTWORTHY);
		player:completeQuest(BASTOK,TRUST_BASTOK);
		player:delKeyItem(dsp.keyItem.BLUE_INSTITUTE_CARD);
		player:addKeyItem(dsp.keyItem.BASTOK_TRUST_PERMIT);
		player:PrintToPlayer("You are now able to call multiple alter egos.", 0xD);
    elseif (csid == 984) then
		player:addSpell(dsp.trust.NAJI, true);
		player:PrintToPlayer("You learned Trust: Naji!", 0xD);
		player:completeQuest(BASTOK,TRUST_BASTOK);
		player:delKeyItem(dsp.keyItem.BLUE_INSTITUTE_CARD);
		player:addKeyItem(dsp.keyItem.BASTOK_TRUST_PERMIT);
		player:messageSpecial(ID.text.KEYITEM_LOST,dsp.keyItem.BLUE_INSTITUTE_CARD);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.keyItem.BASTOK_TRUST_PERMIT);
    end

end;

function TrustMemory(player)
	local memories = 0;
	--2 - THE_EMISSARY
	if (player:hasCompletedMission(BASTOK, THE_EMISSARY)) then
		memories = memories + 2;
	end
	--4 - THE_DOORMAN
	if(player:hasCompletedQuest(BASTOK, THE_DOORMAN)) then
		memories = memories + 4;
	end
	--8 - LIGHT_OF_JUDGMENT
	if(player:hasCompletedMission(TOAU, LIGHT_OF_JUDGMENT)) then
		memories = memories + 8;
	end
	--16 - Chocobo racing
	--if() then
	--	memories = memories + 16;
	--end
	return memories;
end