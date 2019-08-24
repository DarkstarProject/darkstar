-----------------------------------
-- Area: Chateau d'Oraguille
-- Door: Prince Royal's
-- Finishes Quest: A Boy's Dream, Under Oath
-- Involved in Missions: 3-1, 5-2, 8-2
-- !pos -38 -3 73 233
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/titles");
local ID = require("scripts/zones/Chateau_dOraguille/IDs");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)

    local currentMission = player:getCurrentMission(SANDORIA);
    local MissionStatus = player:getVar("MissionStatus");
    local infiltrateDavoi = player:hasCompletedMission(SANDORIA,INFILTRATE_DAVOI);

    local Wait1DayRanperre = player:getVar("Wait1DayForRanperre_date");
    local osdate = tonumber(os.date("%j"));
	local rank6 = player:getRank(BASTOK) >= 6 and 1 or player:getRank(SANDORIA) >= 6 and 1 or player:getRank(WINDURST) >= 6 and 1 or 0;


    if (player:getVar("aBoysDreamCS") == 8) then
        player:startEvent(88);
    elseif (player:getQuestStatus(SANDORIA,A_BOY_S_DREAM) == QUEST_COMPLETED and player:getQuestStatus(SANDORIA,UNDER_OATH) == QUEST_AVAILABLE and player:getMainJob() == dsp.job.PLD) then
        player:startEvent(90);
    elseif (player:getVar("UnderOathCS") == 8) then
        player:startEvent(89);
	elseif (rank6 == 1 and player:hasKeyItem(dsp.ki.SAN_DORIA_TRUST_PERMIT) == true and player:hasSpell(dsp.trust.TRION) == false) then			
		player:startEvent(574,0,0,0,TrustMemory(player),0,0,0,0); -- TRUST
    elseif (currentMission == INFILTRATE_DAVOI and infiltrateDavoi == false and MissionStatus == 0) then
        player:startEvent(553,0,dsp.ki.ROYAL_KNIGHTS_DAVOI_REPORT);
    elseif (currentMission == INFILTRATE_DAVOI and MissionStatus == 4) then
        player:startEvent(554,0,dsp.ki.ROYAL_KNIGHTS_DAVOI_REPORT);
    elseif (currentMission == THE_SHADOW_LORD and MissionStatus == 1) then
        player:startEvent(547);
    elseif (currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 0) then
        player:startEvent(81);
    elseif (CurrentMission == RANPERRE_S_FINAL_REST and MissionStatus == 4 and Wait1DayRanperre ~= osdate) then -- Ready now.
        player:startEvent(21);
    elseif (currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 7) then
        player:startEvent(21);
    elseif (player:hasCompletedMission(SANDORIA,LIGHTBRINGER) and player:getRank() == 9 and player:getVar("Cutscenes_8-2") == 0) then
        player:startEvent(63);
    else
        player:startEvent(522);
    end

    return 1;

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 553) then
        player:setVar("MissionStatus",2);
    elseif (csid == 547) then
        player:setVar("MissionStatus",2);
    elseif (csid == 554) then
        finishMissionTimeline(player,3,csid,option);
    elseif (csid == 88) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,14095);
        else
            if (player:getMainJob() == dsp.job.PLD) then
                player:addQuest(SANDORIA,UNDER_OATH);
            end
            player:delKeyItem(dsp.ki.KNIGHTS_BOOTS);
            player:addItem(14095);
            player:messageSpecial(ID.text.ITEM_OBTAINED,14095); -- Gallant Leggings
            player:setVar("aBoysDreamCS",0);
            player:addFame(SANDORIA,AF2_FAME);
            player:completeQuest(SANDORIA,A_BOY_S_DREAM);
        end
    elseif (csid == 90 and option ==1) then
        player:addQuest(SANDORIA,UNDER_OATH);
        player:setVar("UnderOathCS",0);
    elseif (csid == 89) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,12644);
        else
            player:addItem(12644);
            player:messageSpecial(ID.text.ITEM_OBTAINED,12644); -- Gallant Surcoat
            player:setVar("UnderOathCS",9);
            player:addFame(SANDORIA,AF3_FAME);
            player:setTitle(dsp.title.PARAGON_OF_PALADIN_EXCELLENCE);
            player:completeQuest(SANDORIA,UNDER_OATH);
        end
    elseif (csid == 81) then
        player:setVar("MissionStatus",1);
    elseif (csid == 21) then
        player:setVar("Wait1DayForRanperre_date",0);
        player:setVar("MissionStatus",8);
    elseif (csid == 63) then
        player:setVar("Cutscenes_8-2",1)
	
	--TRUST
	elseif (csid == 574 and option == 2) then
		player:addSpell(dsp.trust.TRION, true);
		player:PrintToPlayer("You learned Trust: Trion!", 0xD);
    end

end;

function TrustMemory(player)
	local memories = 0;
	--2 - LIGHTBRINGER
	if(player:hasCompletedMission(SANDORIA, LIGHTBRINGER)) then
		memories = memories + 2;
	end
	--4 - IMMORTAL_SENTRIES
	if(player:hasCompletedMission(TOAU, IMMORTAL_SENTRIES)) then
		memories = memories + 4;
	end
	--8 - UNDER_OATH
	if(player:hasCompletedMission(SANDORIA,UNDER_OATH)) then
		memories = memories + 8;
	end
	--16 - FIT_FOR_A_PRINCE
	if(player:hasCompletedQuest(SANDORIA, FIT_FOR_A_PRINCE)) then
		memories = memories + 16;
	end
	--32 - Hero's Combat BCNM
	--if(playervar for Hero's Combat) then
	--	memories = memories + 32;
	--end
	return memories;
end
