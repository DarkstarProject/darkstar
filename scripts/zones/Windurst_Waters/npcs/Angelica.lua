-----------------------------------
-- Area: Windurst Waters
--  NPC: Angelica
-- Starts and Finished Quest: A Pose By Any Other Name
-- !pos -70 -10 -6 238
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Waters/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    posestatus = player:getQuestStatus(WINDURST,A_POSE_BY_ANY_OTHER_NAME);
    if (posestatus == QUEST_AVAILABLE and player:getVar("QuestAPoseByOtherName_prog") == 0 and player:needToZone() == false) then
        player:startEvent(87);                                                     -- A POSE BY ANY OTHER NAME: Before Quest
        player:setVar("QuestAPoseByOtherName_prog",1);
    elseif (posestatus == QUEST_AVAILABLE and player:getVar("QuestAPoseByOtherName_prog") == 1) then
        player:setVar("QuestAPoseByOtherName_prog",2);
        mjob = player:getMainJob();
        if (mjob == JOBS.WAR or mjob == JOBS.PLD or mjob == JOBS.DRK or mjob == JOBS.DRG or mjob == JOBS.COR) then      -- Quest Start: Bronze Harness (War/Pld/Drk/Drg/Crs)
            player:startEvent(92,0,0,0,12576);
            player:setVar("QuestAPoseByOtherName_equip",12576);
        elseif (mjob == JOBS.MNK or mjob == JOBS.BRD or mjob == JOBS.BLU) then                             -- Quest Start: Robe (Mnk/Brd/Blu)
            player:startEvent(92,0,0,0,12600);
            player:setVar("QuestAPoseByOtherName_equip",12600);
        elseif (mjob == JOBS.THF or mjob == JOBS.BST or mjob == JOBS.RNG or mjob == JOBS.DNC) then             -- Quest Start: Leather Vest (Thf/Bst/Rng/Dnc)
            player:startEvent(92,0,0,0,12568);
            player:setVar("QuestAPoseByOtherName_equip",12568);
        elseif (mjob == JOBS.WHM or mjob == JOBS.BLM or mjob == JOBS.SMN or mjob == JOBS.PUP or mjob == JOBS.SCH) then     -- Quest Start: Tunic (Whm/Blm/Rdm/Smn/Pup/Sch)
            player:startEvent(92,0,0,0,12608);
            player:setVar("QuestAPoseByOtherName_equip",12608);
        elseif (mjob == JOBS.SAM or mjob == JOBS.NIN) then                                         -- Quest Start: Kenpogi(Sam/Nin)
            player:startEvent(92,0,0,0,12584);
            player:setVar("QuestAPoseByOtherName_equip",12584);
        end
    elseif (posestatus == QUEST_ACCEPTED) then
        starttime = player:getVar("QuestAPoseByOtherName_time");
        if ((starttime + 600) >= os.time()) then
            if (player:getEquipID(SLOT_BODY) == player:getVar("QuestAPoseByOtherName_equip")) then
                player:startEvent(96);     ------------------------------------------  QUEST FINISH
            else
                player:startEvent(93,0,0,0,player:getVar("QuestAPoseByOtherName_equip"));-- QUEST REMINDER
            end
        else
            player:startEvent(102);     ------------------------------------------  QUEST FAILURE
        end
    elseif (posestatus == QUEST_COMPLETED and player:needToZone()) then
        player:startEvent(101); -----------------------------------------------    AFTER QUEST
    else
        rand = math.random(1,3);
        if (rand == 1) then
            player:startEvent(86); -------------------------------------------- Standard Conversation 1
        elseif (rand == 2) then
            player:startEvent(88); -------------------------------------------- Standard Conversation 2
        else
            player:startEvent(89); -------------------------------------------- Standard Conversation 3
        end
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 92) then -------------------------- QUEST START
        player:addQuest(WINDURST,A_POSE_BY_ANY_OTHER_NAME);
        player:setVar("QuestAPoseByOtherName_time",os.time());
    elseif (csid == 96) then  --------------------- QUEST FINFISH
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,206);
        else
            player:completeQuest(WINDURST,A_POSE_BY_ANY_OTHER_NAME)
            player:addTitle(SUPER_MODEL);
            player:addItem(206);
            player:messageSpecial(ITEM_OBTAINED,206);
            player:addKeyItem(ANGELICAS_AUTOGRAPH);
            player:messageSpecial(KEYITEM_OBTAINED,ANGELICAS_AUTOGRAPH);
            player:addFame(WINDURST,75);
            player:setVar("QuestAPoseByOtherName_time",0);
            player:setVar("QuestAPoseByOtherName_equip",0);
            player:setVar("QuestAPoseByOtherName_prog",0);
            player:needToZone(true);
        end
    elseif (csid == 102) then  ---------------------- QUEST FAILURE
        player:delQuest(WINDURST,A_POSE_BY_ANY_OTHER_NAME);
        player:addTitle(LOWER_THAN_THE_LOWEST_TUNNEL_WORM);
        player:setVar("QuestAPoseByOtherName_time",0);
        player:setVar("QuestAPoseByOtherName_equip",0);
        player:setVar("QuestAPoseByOtherName_prog",0);
        player:needToZone(true);
    end
end;
