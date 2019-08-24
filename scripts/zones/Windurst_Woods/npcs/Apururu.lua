-----------------------------------
-- Area: Windurst Woods
--  NPC: Apururu
-- Involved in Quests: The Kind Cardian, Can Cardians Cry?
-- !pos -11 -2 13 241
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/titles")
require("scripts/globals/trusts")
-----------------------------------

function onTrade(player,npc,trade)
    -- THE KIND CARDIAN
    if player:getQuestStatus(JEUNO, THE_KIND_CARDIAN) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 969) then
        player:startEvent(397)

    -- CAN CARDIANS CRY?
    elseif player:getQuestStatus(WINDURST, CAN_CARDIANS_CRY) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 551) then
        player:startEvent(325, 0, 20000, 5000)
    end
end

function onTrigger(player,npc)
    local missionStatus = player:getVar("MissionStatus")
    local kindCardian = player:getQuestStatus(JEUNO, THE_KIND_CARDIAN)
    local kindCardianCS = player:getVar("theKindCardianVar")
    local allNewC3000 = player:getQuestStatus(WINDURST, THE_ALL_NEW_C_3000)
    local canCardiansCry = player:getQuestStatus(WINDURST, CAN_CARDIANS_CRY)
	local rank6 = player:getRank(BASTOK) >= 6 and 1 or player:getRank(SANDORIA) >= 6 and 1 or player:getRank(WINDURST) >= 6 and 1 or 0;


    -- WINDURST 1-2: THE HEART OF THE MATTER
    if player:getCurrentMission(WINDURST) == THE_HEART_OF_THE_MATTER then
        if missionStatus == 0 then
            player:startEvent(137)
        elseif missionStatus < 4 then
            player:startEvent(138)
        elseif missionStatus == 6 then
            player:startEvent(143) -- Mission's over - Bad end (ish anyway, you lost the orbs)
        elseif missionStatus == 5 then
            player:startEvent(145) -- Mission's over - Good end (you came back with the orbs)
        end

    -- WINDURST 8-2: THE JESTER WHO'D BE KING
    elseif player:getCurrentMission(WINDURST) == THE_JESTER_WHO_D_BE_KING then
        if missionStatus == 0 then
            player:startEvent(588)
        elseif missionStatus == 2 then
            player:startEvent(601)
        elseif missionStatus == 6 then
            player:startEvent(590)
        elseif missionStatus == 7 then
            player:startEvent(589)
        elseif missionStatus == 8 then
            player:startEvent(592)
        elseif missionStatus == 10 then
            player:startEvent(609)
        end

    -- WINDURST 9-1: DOLL OF THE DEAD
    elseif player:getCurrentMission(WINDURST) == DOLL_OF_THE_DEAD then
        if missionStatus == 0 then
            player:startEvent(619)
        elseif missionStatus == 3 then
            player:startEvent(620)
        elseif missionStatus == 6 then
            player:startEvent(621)
        end
	
	--TRUST:Ajido
	elseif (player:hasKeyItem(dsp.ki.WINDURST_TRUST_PERMIT) == true
		and player:hasSpell(dsp.trust.NANAA_MIHGO) == true and player:hasSpell(dsp.trust.AJIDO_MARUJIDO) == false) then			
		player:startEvent(866,0,0,0,TrustMemory(player),0,0,0,rank6); -- TRUST

    -- THE KIND CARDIAN
    elseif kindCardian == QUEST_ACCEPTED then
        if kindCardianCS == 0 then
            player:startEvent(392)
        elseif kindCardianCS == 1 then
            player:startEvent(393)
        elseif kindCardianCS == 2 then
            player:startEvent(398)
        end

    -- CAN CARDIANS CRY?
    elseif allNewC3000 == QUEST_COMPLETED and canCardiansCry == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >= 5 then
        player:startEvent(319, 0, 20000) -- start quest
    elseif canCardiansCry == QUEST_ACCEPTED then
        player:startEvent(320, 0, 20000) -- reminder
    elseif canCardiansCry == QUEST_COMPLETED then
        player:startEvent(330) -- new standard dialog

    -- STANDARD DIALOG
    else
        player:startEvent(274)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
	--TRUST
    if csid == 866 and option == 2 then
		player:addSpell(dsp.trust.AJIDO_MARUJIDO, true);
		player:PrintToPlayer("You learned Trust: Ajido-Marujido!", 0xD);
		
    -- WINDURST 1-2: THE HEART OF THE MATTER
    elseif csid == 137 then
        player:setVar("MissionStatus", 1)

        npcUtil.giveKeyItem(player,
            {
                dsp.ki.FIRST_DARK_MANA_ORB,
                dsp.ki.SECOND_DARK_MANA_ORB,
                dsp.ki.THIRD_DARK_MANA_ORB,
                dsp.ki.FOURTH_DARK_MANA_ORB,
                dsp.ki.FIFTH_DARK_MANA_ORB,
                dsp.ki.SIXTH_DARK_MANA_ORB
            }
        )

        player:setVar("MissionStatus_orb1", 1) -- Set the orb variables: 1 = not handled, 2 = handled
        player:setVar("MissionStatus_orb2", 1)
        player:setVar("MissionStatus_orb3", 1)
        player:setVar("MissionStatus_orb4", 1)
        player:setVar("MissionStatus_orb5", 1)
        player:setVar("MissionStatus_orb6", 1)
    elseif csid == 143 or csid == 145 then
        finishMissionTimeline(player, 1, csid, option)

        player:setVar("MissionStatus_orb1", 0)
        player:setVar("MissionStatus_orb2", 0)
        player:setVar("MissionStatus_orb3", 0)
        player:setVar("MissionStatus_orb4", 0)
        player:setVar("MissionStatus_orb5", 0)
        player:setVar("MissionStatus_orb6", 0)

        player:delKeyItem(dsp.ki.FIRST_GLOWING_MANA_ORB) -- Remove the glowing orb key items
        player:delKeyItem(dsp.ki.SECOND_GLOWING_MANA_ORB)
        player:delKeyItem(dsp.ki.THIRD_GLOWING_MANA_ORB)
        player:delKeyItem(dsp.ki.FOURTH_GLOWING_MANA_ORB)
        player:delKeyItem(dsp.ki.FIFTH_GLOWING_MANA_ORB)
        player:delKeyItem(dsp.ki.SIXTH_GLOWING_MANA_ORB)

    -- WINDURST 8-2: THE JESTER WHO'D BE KING
    elseif csid == 588 then
        player:setVar("MissionStatus", 1)
        npcUtil.giveKeyItem(player, dsp.ki.MANUSTERY_RING)
    elseif csid == 601 then
        player:setVar("MissionStatus", 3)
    elseif csid == 590 then
        player:setVar("MissionStatus", 7)
    elseif csid == 592 then
        player:setVar("MissionStatus", 9)
    elseif csid == 609 then
        player:setVar("ShantottoCS",1)
        finishMissionTimeline(player, 3, csid, option)

    -- WINDURST 9-1: DOLL OF THE DEAD
    elseif csid == 619 then
        player:setVar("MissionStatus", 1)
    elseif csid == 620 then
        player:setVar("MissionStatus", 4)
    elseif csid == 621 then
        player:setVar("MissionStatus", 7)
        player:messageSpecial(ID.text.KEYITEM_LOST, dsp.ki.LETTER_FROM_ZONPAZIPPA)
        player:delKeyItem(dsp.ki.LETTER_FROM_ZONPAZIPPA)

    -- THE KIND CARDIAN
    elseif csid == 392 and option == 1 then
        player:setVar("theKindCardianVar", 1)
    elseif csid == 397 then
        player:delKeyItem(dsp.ki.TWO_OF_SWORDS)
        player:setVar("theKindCardianVar", 2)
        player:addFame(WINDURST, 30)
        player:confirmTrade()

    -- CAN CARDIANS CRY?
    elseif csid == 319 then
        player:addQuest(WINDURST,CAN_CARDIANS_CRY)
    elseif csid == 325 and npcUtil.completeQuest(player, WINDURST, CAN_CARDIANS_CRY, {gil=5000}) then
        player:confirmTrade()
    end
end

function TrustMemory(player)
	local memories = 0;
	--2 - Saw him at the start of the game
	if (player:getNation() == WINDURST) then
		memories = memories + 2;
	end
	--4 - WONDER_WANDS
	if(player:hasCompletedQuest(WINDURST, WONDER_WANDS)) then
		memories = memories + 4;
	end
	--8 - THE_TIGRESS_STIRS
	if(player:hasCompletedQuest(WINDURST,THE_TIGRESS_STIRS)) then
		memories = memories + 8;
	end
	--16 - I_CAN_HEAR_A_RAINBOW
	if(player:hasCompletedQuest(WINDURST, I_CAN_HEAR_A_RAINBOW)) then
		memories = memories + 16;
	end
	--32 - Hero's Combat (BCNM)
	--if(playervar for Hero's Combat) then
	--	memories = memories + 32;
	--end
	
	--64 - MOON_READING
	if(player:hasCompletedMission(WINDURST, MOON_READING)) then
		memories = memories + 64;
	end
	return memories;
end