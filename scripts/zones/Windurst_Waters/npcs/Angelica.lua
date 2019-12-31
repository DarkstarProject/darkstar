-----------------------------------
-- Area: Windurst Waters
--  NPC: Angelica
-- Starts and Finished Quest: A Pose By Any Other Name
-- !pos -70 -10 -6 238
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters/IDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    posestatus = player:getQuestStatus(WINDURST,dsp.quest.id.windurst.A_POSE_BY_ANY_OTHER_NAME);
    if (posestatus == QUEST_AVAILABLE and player:getCharVar("QuestAPoseByOtherName_prog") == 0 and player:needToZone() == false) then
        player:startEvent(87);                                                     -- A POSE BY ANY dsp.nation.OTHER NAME: Before Quest
        player:setCharVar("QuestAPoseByOtherName_prog",1);
    elseif (posestatus == QUEST_AVAILABLE and player:getCharVar("QuestAPoseByOtherName_prog") == 1) then
        player:setCharVar("QuestAPoseByOtherName_prog",2);
        mjob = player:getMainJob();
        if (mjob == dsp.job.WAR or mjob == dsp.job.PLD or mjob == dsp.job.DRK or mjob == dsp.job.DRG or mjob == dsp.job.COR) then      -- Quest Start: Bronze Harness (War/Pld/Drk/Drg/Crs)
            player:startEvent(92,0,0,0,12576);
            player:setCharVar("QuestAPoseByOtherName_equip",12576);
        elseif (mjob == dsp.job.MNK or mjob == dsp.job.BRD or mjob == dsp.job.BLU) then                             -- Quest Start: Robe (Mnk/Brd/Blu)
            player:startEvent(92,0,0,0,12600);
            player:setCharVar("QuestAPoseByOtherName_equip",12600);
        elseif (mjob == dsp.job.THF or mjob == dsp.job.BST or mjob == dsp.job.RNG or mjob == dsp.job.DNC) then             -- Quest Start: Leather Vest (Thf/Bst/Rng/Dnc)
            player:startEvent(92,0,0,0,12568);
            player:setCharVar("QuestAPoseByOtherName_equip",12568);
        elseif (mjob == dsp.job.WHM or mjob == dsp.job.BLM or mjob == dsp.job.SMN or mjob == dsp.job.PUP or mjob == dsp.job.SCH) then     -- Quest Start: Tunic (Whm/Blm/Rdm/Smn/Pup/Sch)
            player:startEvent(92,0,0,0,12608);
            player:setCharVar("QuestAPoseByOtherName_equip",12608);
        elseif (mjob == dsp.job.SAM or mjob == dsp.job.NIN) then                                         -- Quest Start: Kenpogi(Sam/Nin)
            player:startEvent(92,0,0,0,12584);
            player:setCharVar("QuestAPoseByOtherName_equip",12584);
        end
    elseif (posestatus == QUEST_ACCEPTED) then
        starttime = player:getCharVar("QuestAPoseByOtherName_time");
        if ((starttime + 600) >= os.time()) then
            if (player:getEquipID(dsp.slot.BODY) == player:getCharVar("QuestAPoseByOtherName_equip")) then
                player:startEvent(96);     ------------------------------------------  QUEST FINISH
            else
                player:startEvent(93,0,0,0,player:getCharVar("QuestAPoseByOtherName_equip"));-- QUEST REMINDER
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
end;

function onEventFinish(player,csid,option)
    if (csid == 92) then -------------------------- QUEST START
        player:addQuest(WINDURST,dsp.quest.id.windurst.A_POSE_BY_ANY_OTHER_NAME);
        player:setCharVar("QuestAPoseByOtherName_time",os.time());
    elseif (csid == 96) then  --------------------- QUEST FINFISH
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,206);
        else
            player:completeQuest(WINDURST,dsp.quest.id.windurst.A_POSE_BY_ANY_OTHER_NAME)
            player:addTitle(dsp.title.SUPER_MODEL);
            player:addItem(206);
            player:messageSpecial(ID.text.ITEM_OBTAINED,206);
            player:addKeyItem(dsp.ki.ANGELICAS_AUTOGRAPH);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.ANGELICAS_AUTOGRAPH);
            player:addFame(WINDURST,75);
            player:setCharVar("QuestAPoseByOtherName_time",0);
            player:setCharVar("QuestAPoseByOtherName_equip",0);
            player:setCharVar("QuestAPoseByOtherName_prog",0);
            player:needToZone(true);
        end
    elseif (csid == 102) then  ---------------------- QUEST FAILURE
        player:delQuest(WINDURST,dsp.quest.id.windurst.A_POSE_BY_ANY_OTHER_NAME);
        player:addTitle(dsp.title.LOWER_THAN_THE_LOWEST_TUNNEL_WORM);
        player:setCharVar("QuestAPoseByOtherName_time",0);
        player:setCharVar("QuestAPoseByOtherName_equip",0);
        player:setCharVar("QuestAPoseByOtherName_prog",0);
        player:needToZone(true);
    end
end;
