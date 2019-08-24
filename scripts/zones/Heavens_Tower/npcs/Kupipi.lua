-----------------------------------
-- Area: Heaven's Tower
--  NPC: Kupipi
-- Involved in Mission 2-3
-- Involved in Quest: Riding on the Clouds
-- !pos 2 0.1 30 242
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
local ID = require("scripts/zones/Heavens_Tower/IDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_4") == 8) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_4",0);
            player:tradeComplete();
            player:addKeyItem(dsp.ki.SPIRITED_STONE);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SPIRITED_STONE);
        end
    end
    if (trade:hasItemQty(4365,1) and trade:getItemCount() == 1 and player:getNation() == dsp.nation.WINDURST and player:getRank() >= 2 and player:hasKeyItem(dsp.ki.PORTAL_CHARM) == false) then -- Trade Rolanberry
        if (player:hasCompletedMission(WINDURST,WRITTEN_IN_THE_STARS)) then
            player:startEvent(291); -- Qualifies for the reward immediately
        else
            player:startEvent(292); -- Kupipi owes you the portal charm later
        end
    end
end;

function onTrigger(player,npc)

    local pNation = player:getNation();
    local currentMission = player:getCurrentMission(pNation);
    local MissionStatus = player:getVar("MissionStatus");
	TrustSandoria = player:getQuestStatus(SANDORIA,TRUST_SANDORIA);
	TrustBastok   = player:getQuestStatus(BASTOK,TRUST_BASTOK);
	TrustWindurst = player:getQuestStatus(WINDURST,TRUST_WINDURST);
	local Level = player:getMainLvl();
	local rank3 = player:getRank(BASTOK) >= 3 and 1 or player:getRank(SANDORIA) >= 3 and 1 or player:getRank(WINDURST) >= 3 and 1 or 0;

	--TRUST
	if (Level >= 5 and TrustWindurst == QUEST_ACCEPTED and (TrustBastok == QUEST_COMPLETED or TrustSandoria == QUEST_COMPLETED)) then
		if (player:hasKeyItem(dsp.keyItem.GREEN_INSTITUTE_CARD) == true and player:hasSpell(dsp.trust.KUPIPI) == false) then
			player:startEvent(439,0,0,0,TrustMemory(player),0,0,0,rank3);	
		end
	elseif (Level >= 5 and TrustWindurst == QUEST_ACCEPTED) then
		if (player:hasKeyItem(dsp.keyItem.GREEN_INSTITUTE_CARD) == true and player:hasSpell(dsp.trust.KUPIPI) == false) then
			player:startEvent(435,0,0,0,TrustMemory(player),0,0,0,rank3);	
		elseif (player:hasSpell(dsp.trust.KUPIPI) == true and player:getVar("WindurstFirstTrust") == 1) then
			player:startEvent(436);
		elseif (player:getVar("WindurstFirstTrust") == 2) then
			player:startEvent(437);
		end		
		
		
	elseif (pNation == dsp.nation.SANDORIA) then
        -- San d'Oria Mission 2-3 Part I - Windurst > Bastok
        if (currentMission == JOURNEY_TO_WINDURST) then
            if (MissionStatus == 4) then
                player:startEvent(238,1,1,1,1,pNation);
            elseif (MissionStatus == 5) then
                player:startEvent(240);
            elseif (MissionStatus == 6) then
                player:startEvent(241);
            end
        -- San d'Oria Mission 2-3 Part II - Bastok > Windurst
        elseif (currentMission == JOURNEY_TO_WINDURST2) then
            if (MissionStatus == 7) then
                player:startEvent(242,1,1,1,1,0);
            elseif (MissionStatus == 8) then
                player:startEvent(243);
            elseif (MissionStatus == 9) then
                player:startEvent(246);
            elseif (MissionStatus == 10) then
                player:startEvent(247);
            end
        else
            player:startEvent(251);
        end
    elseif (pNation == dsp.nation.BASTOK) then
        -- Bastok Mission 2-3 Part I - Windurst > San d'Oria
        if (currentMission == THE_EMISSARY_WINDURST) then
            if (MissionStatus == 3) then
                player:startEvent(238,1,1,1,1,pNation);
            elseif (MissionStatus <= 5) then
                player:startEvent(240);
            elseif (MissionStatus == 6) then
                player:startEvent(241);
            end
        -- Bastok Mission 2-3 Part II - San d'Oria > Windurst
        elseif (currentMission == THE_EMISSARY_WINDURST2) then
            if (MissionStatus == 7) then
                player:startEvent(242,1,1,1,1,pNation);
            elseif (MissionStatus == 8) then
                player:startEvent(243);
            elseif (MissionStatus == 9) then
                player:startEvent(244);
            elseif (MissionStatus == 10) then
                player:startEvent(245);
            end
        else
            player:startEvent(251);
        end
    elseif (pNation == dsp.nation.WINDURST) then
        if (currentMission == THE_THREE_KINGDOMS and MissionStatus == 0) then
            player:startEvent(95,0,0,0,dsp.ki.LETTER_TO_THE_CONSULS_WINDURST);
        elseif (currentMission == THE_THREE_KINGDOMS and MissionStatus == 11) then
            player:startEvent(101,0,0,dsp.ki.ADVENTURERS_CERTIFICATE);
        elseif (currentMission == THE_THREE_KINGDOMS) then
            player:startEvent(97);
        elseif (currentMission == TO_EACH_HIS_OWN_RIGHT and MissionStatus == 0) then
            player:startEvent(103,0,0,dsp.ki.STARWAY_STAIRWAY_BAUBLE);
        elseif (currentMission == TO_EACH_HIS_OWN_RIGHT and MissionStatus == 1) then
            player:startEvent(104);
        elseif (player:getCurrentMission(WINDURST) == THE_JESTER_WHO_D_BE_KING and MissionStatus == 3) then
            player:startEvent(326);
        elseif (player:hasCompletedMission(WINDURST,WRITTEN_IN_THE_STARS) and player:getVar("OwesPortalCharm") == 1) then
            player:startEvent(293); -- Kupipi repays your favor
        elseif (player:getCurrentMission(WINDURST) == MOON_READING and MissionStatus >= 3) then
            player:startEvent(400); -- Kupipi in disbelief over player becoming Rank 10
        elseif (pNation == dsp.nation.WINDURST) and (player:getRank() == 10) then
            player:startEvent(408); -- After achieving Windurst Rank 10, Kupipi has more to say
        else
            player:startEvent(251);
        end
		
	--TRUST END
	elseif(TrustWindurst == QUEST_COMPLETED and player:hasSpell(dsp.trust.NANAA_MIHGO) == false) then
		player:startEvent(438,0,0,0,0,0,0,0,rank3);
    else
        player:startEvent(251);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 238) then
        if (player:getNation() == dsp.nation.BASTOK) then
            player:setVar("MissionStatus",4);
            player:addKeyItem(dsp.ki.SWORD_OFFERING);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SWORD_OFFERING);
        else
            player:setVar("MissionStatus",5);
            player:addKeyItem(dsp.ki.SHIELD_OFFERING);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SHIELD_OFFERING);
        end
    elseif (csid == 244 or csid == 246) then
        player:setVar("MissionStatus",10);
    elseif (csid == 242) then
        player:addKeyItem(dsp.ki.DARK_KEY);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.DARK_KEY);
        player:setVar("MissionStatus",8);
    elseif (csid == 95) then
        player:setVar("MissionStatus",1);
        player:addKeyItem(dsp.ki.LETTER_TO_THE_CONSULS_WINDURST);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.LETTER_TO_THE_CONSULS_WINDURST);
    elseif (csid == 103) then
        player:setVar("MissionStatus",1);
        player:addKeyItem(dsp.ki.STARWAY_STAIRWAY_BAUBLE);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.STARWAY_STAIRWAY_BAUBLE);
    elseif (csid == 101) then
        finishMissionTimeline(player,1,csid,option);
    elseif (csid == 291) then -- All condition met, grant Portal Charm
        player:tradeComplete();
        player:addKeyItem(dsp.ki.PORTAL_CHARM);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.PORTAL_CHARM);
    elseif (csid == 292) then -- Traded rolanberry, but not all conditions met
        player:tradeComplete();
        player:setVar("OwesPortalCharm",1);
    elseif (csid == 293) then -- Traded rolanberry before, and all conditions are now met
        player:setVar("OwesPortalCharm",0);
        player:addKeyItem(dsp.ki.PORTAL_CHARM);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.PORTAL_CHARM);
    elseif (csid == 326) then
        player:setVar("MissionStatus",4);
    elseif (csid == 400) then
        player:setVar("KupipiDisbelief",0);
    elseif (csid == 408) then
        player:setVar("KupipiRankTenText",1);
		
	--TRUST	
	elseif (csid == 435) then
		player:addSpell(dsp.trust.KUPIPI, true);
		player:addVar("WindurstFirstTrust", 1);
		player:PrintToPlayer("You learned Trust: Kupipi!", 0xD);
	elseif (csid == 437) then
		player:messageSpecial(ID.text.KEYITEM_LOST,dsp.keyItem.GREEN_INSTITUTE_CARD);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.keyItem.WINDURST_TRUST_PERMIT);
		player:setVar("WindurstFirstTrust", 0);
		player:addTitle(dsp.title.THE_TRUSTWORTHY);
		player:completeQuest(WINDURST,TRUST_WINDURST);
		player:delKeyItem(dsp.keyItem.GREEN_INSTITUTE_CARD);
		player:addKeyItem(dsp.keyItem.WINDURST_TRUST_PERMIT);
		player:PrintToPlayer("You are now able to call multiple alter egos.", 0xD);
    elseif (csid == 439) then
		player:addSpell(dsp.trust.KUPIPI, true);
		player:PrintToPlayer("You learned Trust: Kupipi!", 0xD);
		player:completeQuest(WINDURST,TRUST_WINDURST);
		player:delKeyItem(dsp.keyItem.GREEN_INSTITUTE_CARD);
		player:addKeyItem(dsp.keyItem.WINDURST_TRUST_PERMIT);
		player:messageSpecial(ID.text.KEYITEM_LOST,dsp.keyItem.GREEN_INSTITUTE_CARD);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.keyItem.WINDURST_TRUST_PERMIT);
    end

end;

function TrustMemory(player)
	local memories = 0;
	--2 - THE_THREE_KINGDOMS
	if (player:hasCompletedMission(WINDURST, THE_THREE_KINGDOMS)) then
		memories = memories + 2;
	end
	--4 - nothing
	--8 - MOON_READING
	if(player:hasCompletedMission(WINDURST, MOON_READING)) then
		memories = memories + 8;
	end
	--16 - chocobo racing
	--if() then
	--	memories = memories + 16;
	--end
	return memories;
end