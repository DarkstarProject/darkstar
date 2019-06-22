-----------------------------------
-- Area: Metalworks
--  NPC: Cid
-- Starts & Finishes Quest: Cid's Secret, The Usual, Dark Puppet (start), Shoot First, Ask Questions Later
-- Involved in Mission: Bastok 7-1
-- !pos -12 -12 1 237
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/wsquest")
local ID = require("scripts/zones/Metalworks/IDs")
-----------------------------------

local wsQuest = dsp.wsquest.detonator

local function checkThreePaths(player)
    if player:getVar("COP_Tenzen_s_Path") == 11 and player:getVar("COP_Ulmia_s_Path") == 8 and player:getVar("COP_Louverance_s_Path") == 10 then
        player:completeMission(COP, dsp.mission.id.cop.THREE_PATHS)
        player:addMission(COP, dsp.mission.id.cop.FOR_WHOM_THE_VERSE_IS_SUNG)
        player:setVar("PromathiaStatus", 0)
    end
end

function onTrade(player,npc,trade)
    local wsQuestEvent = dsp.wsquest.getTradeEvent(wsQuest,player,trade)

    if wsQuestEvent ~= nil then
        player:startEvent(wsQuestEvent)
    elseif (player:getCurrentMission(BASTOK) == dsp.mission.id.bastok.THE_CRYSTAL_LINE and player:getVar("MissionStatus") == 1) then
        if (trade:getItemQty(613,1) and trade:getItemCount() == 1) then
            player:startEvent(506)
        end
    end

end

function onTrigger(player,npc)
    local wsQuestEvent = dsp.wsquest.getTriggerEvent(wsQuest,player)
    local currentday = tonumber(os.date("%j"))
    local CidsSecret = player:getQuestStatus(BASTOK,dsp.quest.id.bastok.CID_S_SECRET)
    local LetterKeyItem = player:hasKeyItem(dsp.ki.UNFINISHED_LETTER)
    local currentMission = player:getCurrentMission(BASTOK)
    local currentCOPMission = player:getCurrentMission(COP)
    local UlmiaPath = player:getVar("COP_Ulmia_s_Path")
    local TenzenPath = player:getVar("COP_Tenzen_s_Path")
    local LouverancePath = player:getVar("COP_Louverance_s_Path")
    local TreePathAv = 0

    if wsQuestEvent ~= nil then
        player:startEvent(wsQuestEvent)
    elseif (currentCOPMission == dsp.mission.id.cop.DAWN and player:getVar("PromathiaStatus")==3 and player:getVar("Promathia_kill_day")~=currentday and player:getVar("COP_tenzen_story")== 0 ) then
        player:startEvent(897) -- COP event
    elseif (currentCOPMission == dsp.mission.id.cop.CALM_BEFORE_THE_STORM and player:hasKeyItem(dsp.ki.LETTERS_FROM_ULMIA_AND_PRISHE) == false and player:getVar("COP_Dalham_KILL") == 2 and player:getVar("COP_Boggelmann_KILL") == 2 and player:getVar("Cryptonberry_Executor_KILL")==2) then
        player:startEvent(892) -- COP event
    elseif (currentCOPMission == dsp.mission.id.cop.FIRE_IN_THE_EYES_OF_MEN and player:getVar("PromathiaStatus")==2 and player:getVar("Promathia_CID_timer")~=VanadielDayOfTheYear()) then
        player:startEvent(890) -- COP event
    elseif (currentCOPMission == dsp.mission.id.cop.FIRE_IN_THE_EYES_OF_MEN and player:getVar("PromathiaStatus")==1) then
        player:startEvent(857) -- COP event
    elseif (currentCOPMission == dsp.mission.id.cop.ONE_TO_BE_FEARED and player:getVar("PromathiaStatus") == 0) then
        player:startEvent(856) -- COP event
    elseif (currentCOPMission == dsp.mission.id.cop.THREE_PATHS and LouverancePath == 6 ) then
        player:startEvent(852) -- COP event
    elseif (currentCOPMission == dsp.mission.id.cop.THREE_PATHS and LouverancePath == 9 ) then
        if (TenzenPath==11 and UlmiaPath==8) then
            TreePathAv=6
        elseif (TenzenPath==11) then
            TreePathAv=2
        elseif (UlmiaPath==8) then
            TreePathAv=4
        else
            TreePathAv=1
        end
        player:startEvent(853,TreePathAv) -- COP event
    elseif (currentCOPMission == dsp.mission.id.cop.THREE_PATHS and TenzenPath == 10 ) then
        if (UlmiaPath==8 and LouverancePath==10) then
            TreePathAv=5
        elseif (LouverancePath==10) then
            TreePathAv=3
        elseif (UlmiaPath==8) then
            TreePathAv=4
        else
            TreePathAv=1
        end
        player:startEvent(854,TreePathAv) -- COP event
    elseif (currentCOPMission == dsp.mission.id.cop.THREE_PATHS and UlmiaPath == 7 ) then
        if (TenzenPath==11 and LouverancePath==10) then
            TreePathAv=3
        elseif (LouverancePath==10) then
            TreePathAv=1
        elseif (TenzenPath==11) then
            TreePathAv=2
        else
            TreePathAv=0
        end
        player:startEvent(855,TreePathAv) -- COP event
    elseif (currentCOPMission == dsp.mission.id.cop.DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus") > 8) then
        player:startEvent(850) -- COP event
    elseif (currentCOPMission == dsp.mission.id.cop.THE_ENDURING_TUMULT_OF_WAR and player:getVar("PromathiaStatus")==1) then
        player:startEvent(849) -- COP event
    elseif (currentCOPMission == dsp.mission.id.cop.THE_CALL_OF_THE_WYRMKING and player:getVar("PromathiaStatus")==1) then
        player:startEvent(845) -- COP event
    elseif (currentCOPMission == dsp.mission.id.cop.THE_ROAD_FORKS and player:getVar("EMERALD_WATERS_Status")== 7 and player:getVar("MEMORIES_OF_A_MAIDEN_Status")== 12) then --two paths are finished ?
        player:startEvent(847) -- COP event 3.3
    elseif (player:getMainJob() == dsp.job.DRK and player:getMainLvl() >= AF2_QUEST_LEVEL and player:getQuestStatus(BASTOK,dsp.quest.id.bastok.DARK_LEGACY) == QUEST_COMPLETED and player:getQuestStatus(BASTOK,dsp.quest.id.bastok.DARK_PUPPET) == QUEST_AVAILABLE) then
        player:startEvent(760) -- Start Quest "Dark Puppet"
    elseif (currentMission == dsp.mission.id.bastok.GEOLOGICAL_SURVEY) then
        if (player:hasKeyItem(dsp.ki.RED_ACIDITY_TESTER)) then
            player:startEvent(504)
        elseif (player:hasKeyItem(dsp.ki.BLUE_ACIDITY_TESTER) == false) then
            player:startEvent(503)
        end
    elseif (currentMission == dsp.mission.id.bastok.THE_CRYSTAL_LINE) then
        if (player:hasKeyItem(dsp.ki.C_L_REPORTS)) then
            player:showText(npc,ID.text.MISSION_DIALOG_CID_TO_AYAME)
        else
            player:startEvent(505)
        end
    elseif (currentMission == dsp.mission.id.bastok.THE_FINAL_IMAGE and player:getVar("MissionStatus") == 0) then
        player:startEvent(763) -- Bastok Mission 7-1
    elseif (currentMission == dsp.mission.id.bastok.THE_FINAL_IMAGE and player:getVar("MissionStatus") == 2) then
        player:startEvent(764) -- Bastok Mission 7-1 (with Ki)
    --Begin Cid's Secret
    elseif (player:getFameLevel(BASTOK) >= 4 and CidsSecret == QUEST_AVAILABLE) then
        player:startEvent(507)
    elseif (CidsSecret == QUEST_ACCEPTED and LetterKeyItem == false and player:getVar("CidsSecret_Event") == 1) then
        player:startEvent(508) --After talking to Hilda, Cid gives information on the item she needs
    elseif (CidsSecret == QUEST_ACCEPTED and LetterKeyItem == false) then
        player:startEvent(502) --Reminder dialogue from Cid if you have not spoken to Hilda
    elseif (CidsSecret == QUEST_ACCEPTED and LetterKeyItem) then
        player:startEvent(509)
    --End Cid's Secret
    else
        player:startEvent(500) -- Standard Dialogue
    end

end

-- 503  504  505  506  500  502  720  507  508  509  603  755  760  1010  763  764
-- 780  782  795  796  797  798  799  861  846  848  862  863  851  858  845  847
-- 849  850  852  853  854  855  856  857  868  869  883  884  890  891  892  893
-- 894  895  897  898

function onEventFinish(player,csid,option)
    if (csid == 897) then
        player:setVar("COP_tenzen_story",1)
    elseif (csid == 892) then
        player:addKeyItem(dsp.ki.LETTERS_FROM_ULMIA_AND_PRISHE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.LETTERS_FROM_ULMIA_AND_PRISHE)
    elseif (csid == 890) then
        player:setVar("PromathiaStatus",0)
        player:setVar("Promathia_CID_timer",0)
        player:completeMission(COP,dsp.mission.id.cop.FIRE_IN_THE_EYES_OF_MEN)
        player:addMission(COP,dsp.mission.id.cop.CALM_BEFORE_THE_STORM)
    elseif (csid == 857) then
        player:setVar("PromathiaStatus",2)
        player:setVar("Promathia_CID_timer",VanadielDayOfTheYear())
    elseif (csid == 855) then
        player:setVar("COP_Ulmia_s_Path",8)
        checkThreePaths(player)
    elseif (csid == 854) then
        player:setVar("COP_Tenzen_s_Path",11)
        checkThreePaths(player)
    elseif (csid == 853) then
        player:setVar("COP_Louverance_s_Path",10)
        if player:getVar("COP_Tenzen_s_Path") == 11 and player:getVar("COP_Ulmia_s_Path") == 8 then
            player:addTitle(dsp.title.TRUE_COMPANION_OF_LOUVERANCE)
        else
            player:addTitle(dsp.title.COMPANION_OF_LOUVERANCE)
        end
        checkThreePaths(player)
    elseif (csid == 852) then
        player:setVar("COP_Louverance_s_Path",7)
    elseif (csid == 850) then
        player:setVar("PromathiaStatus",0)
        player:completeMission(COP,dsp.mission.id.cop.DESIRES_OF_EMPTINESS)
        player:addMission(COP,dsp.mission.id.cop.THREE_PATHS)
    elseif (csid == 849) then
        player:setVar("PromathiaStatus",2)
    elseif (csid == 856) then
        player:setVar("PromathiaStatus",1)
    elseif (csid == 845) then
        player:setVar("PromathiaStatus",0)
        player:completeMission(COP,dsp.mission.id.cop.THE_CALL_OF_THE_WYRMKING)
        player:addMission(COP,dsp.mission.id.cop.A_VESSEL_WITHOUT_A_CAPTAIN)
    elseif (csid == 847) then
        -- finishing mission 3.3 and all sub missions
        player:setVar("EMERALD_WATERS_Status",0)
        player:setVar("MEMORIES_OF_A_MAIDEN_Status",0)
        player:completeMission(COP,dsp.mission.id.cop.THE_ROAD_FORKS)
        player:addMission(COP,dsp.mission.id.cop.DESCENDANTS_OF_A_LINE_LOST)
        player:completeMission(COP,dsp.mission.id.cop.DESCENDANTS_OF_A_LINE_LOST)
        player:addMission(COP,dsp.mission.id.cop.COMEDY_OF_ERRORS_ACT_I)
        player:completeMission(COP,dsp.mission.id.cop.COMEDY_OF_ERRORS_ACT_I)
        player:addMission(COP,dsp.mission.id.cop.TENDING_AGED_WOUNDS ) --starting 3.4 COP mission
    elseif (csid == 760) then
        player:addQuest(BASTOK,dsp.quest.id.bastok.DARK_PUPPET)
        player:setVar("darkPuppetCS",1)
    elseif (csid == 503) then
        player:addKeyItem(dsp.ki.BLUE_ACIDITY_TESTER)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.BLUE_ACIDITY_TESTER)
    elseif (csid == 504 or csid == 764) then
        finishMissionTimeline(player,1,csid,option)
    elseif (csid == 505 and option == 0) then
        if (player:getVar("MissionStatus") == 0) then
            if (player:getFreeSlotsCount(0) >= 1) then
                crystal = math.random(4096,4103)
                player:addItem(crystal)
                player:messageSpecial(ID.text.ITEM_OBTAINED, crystal)
                player:setVar("MissionStatus",1)
            else
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,crystal)
            end
        end
    elseif (csid == 506 and option == 0) then
        player:tradeComplete()
        player:addKeyItem(dsp.ki.C_L_REPORTS)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.C_L_REPORTS)
    elseif (csid == 763) then
        player:setVar("MissionStatus",1)
    elseif (csid == 507) then
        player:addQuest(BASTOK,dsp.quest.id.bastok.CID_S_SECRET)
    elseif (csid == 509) then
        if (player:getFreeSlotsCount(0) >= 1) then
            player:delKeyItem(dsp.ki.UNFINISHED_LETTER)
            player:setVar("CidsSecret_Event",0)
            player:addItem(13570)
            player:messageSpecial(ID.text.ITEM_OBTAINED,13570) -- Ram Mantle
            player:addFame(BASTOK,30)
            player:completeQuest(BASTOK,dsp.quest.id.bastok.CID_S_SECRET)
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,13570)
        end
    else
        dsp.wsquest.handleEventFinish(wsQuest,player,csid,option,ID.text.DETONATOR_LEARNED)
    end
end
