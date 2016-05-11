-----------------------------------
-- Area: Windurst Waters
--  NPC: Angelica
-- Starts and Finished Quest: A Pose By Any Other Name
--    Working 100%
--  @zone = 238
--  @pos = -70 -10 -6
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;      

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    posestatus = player:getQuestStatus(WINDURST,A_POSE_BY_ANY_OTHER_NAME);
    if (posestatus == QUEST_AVAILABLE and player:getVar("QuestAPoseByOtherName_prog") == 0 and player:needToZone() == false) then
        player:startEvent(0x0057);                                                     -- A POSE BY ANY OTHER NAME: Before Quest
        player:setVar("QuestAPoseByOtherName_prog",1);
    elseif (posestatus == QUEST_AVAILABLE and player:getVar("QuestAPoseByOtherName_prog") == 1) then
        player:setVar("QuestAPoseByOtherName_prog",2);
        mjob = player:getMainJob();
        if (mjob == JOBS.WAR or mjob == JOBS.PLD or mjob == JOBS.DRK or mjob == JOBS.DRG or mjob == JOBS.COR) then      -- Quest Start: Bronze Harness (War/Pld/Drk/Drg/Crs)
            player:startEvent(0x005c,0,0,0,12576);
            player:setVar("QuestAPoseByOtherName_equip",12576);
        elseif (mjob == JOBS.MNK or mjob == JOBS.BRD or mjob == JOBS.BLU) then                             -- Quest Start: Robe (Mnk/Brd/Blu)
            player:startEvent(0x005c,0,0,0,12600);
            player:setVar("QuestAPoseByOtherName_equip",12600);
        elseif (mjob == JOBS.THF or mjob == JOBS.BST or mjob == JOBS.RNG or mjob == JOBS.DNC) then             -- Quest Start: Leather Vest (Thf/Bst/Rng/Dnc)
            player:startEvent(0x005c,0,0,0,12568);
            player:setVar("QuestAPoseByOtherName_equip",12568);
        elseif (mjob == JOBS.WHM or mjob == JOBS.BLM or mjob == JOBS.SMN or mjob == JOBS.PUP or mjob == JOBS.SCH) then     -- Quest Start: Tunic (Whm/Blm/Rdm/Smn/Pup/Sch)
            player:startEvent(0x005c,0,0,0,12608);
            player:setVar("QuestAPoseByOtherName_equip",12608);
        elseif (mjob == JOBS.SAM or mjob == JOBS.NIN) then                                         -- Quest Start: Kenpogi(Sam/Nin) 
            player:startEvent(0x005c,0,0,0,12584);
            player:setVar("QuestAPoseByOtherName_equip",12584);
        end
    elseif (posestatus == QUEST_ACCEPTED) then
        starttime = player:getVar("QuestAPoseByOtherName_time");
        if ((starttime + 600) >= os.time()) then
            if (player:getEquipID(SLOT_BODY) == player:getVar("QuestAPoseByOtherName_equip")) then
                player:startEvent(0x0060);     ------------------------------------------  QUEST FINISH 
            else
                player:startEvent(0x005d,0,0,0,player:getVar("QuestAPoseByOtherName_equip"));-- QUEST REMINDER
            end
        else
            player:startEvent(0x0066);     ------------------------------------------  QUEST FAILURE
        end
    elseif (posestatus == QUEST_COMPLETED and player:needToZone()) then
        player:startEvent(0x0065); -----------------------------------------------    AFTER QUEST
    else
        rand = math.random(1,3);
        if (rand == 1) then
            player:startEvent(0x0056); -------------------------------------------- Standard Conversation 1
        elseif (rand == 2) then
            player:startEvent(0x0058); -------------------------------------------- Standard Conversation 2
        else
            player:startEvent(0x0059); -------------------------------------------- Standard Conversation 3
        end
    end    
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x005c) then -------------------------- QUEST START
        player:addQuest(WINDURST,A_POSE_BY_ANY_OTHER_NAME);
        player:setVar("QuestAPoseByOtherName_time",os.time());
    elseif (csid == 0x0060) then  --------------------- QUEST FINFISH
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
    elseif (csid == 0x0066) then  ---------------------- QUEST FAILURE
        player:delQuest(WINDURST,A_POSE_BY_ANY_OTHER_NAME);
        player:addTitle(LOWER_THAN_THE_LOWEST_TUNNEL_WORM);
        player:setVar("QuestAPoseByOtherName_time",0);
        player:setVar("QuestAPoseByOtherName_equip",0);
        player:setVar("QuestAPoseByOtherName_prog",0);
        player:needToZone(true);
    end
end;
