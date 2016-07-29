-----------------------------------
-- Area: Windurst Waters
--  NPC: Furakku-Norakku
-- Involved in Quests: Early Bird Catches the Bookworm, Chasing Tales, Class Reunion
--    @pos -19 -5 101 238
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Waters/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local bookwormStatus = player:getQuestStatus(WINDURST,EARLY_BIRD_CATCHES_THE_BOOKWORM);
    local chasingStatus = player:getQuestStatus(WINDURST,CHASING_TALES);
    local bookNotifications = player:hasKeyItem(OVERDUE_BOOK_NOTIFICATIONS);
    local ClassReunion = player:getQuestStatus(WINDURST,CLASS_REUNION);
    local ClassReunionProgress = player:getVar("ClassReunionProgress");
    local talk2 = player:getVar("ClassReunion_TalkedToFurakku");

    if (bookwormStatus == QUEST_ACCEPTED and bookNotifications == false) then
        player:startEvent(0x0185); -- During Quest "Early Bird Catches the Bookworm" 1
    elseif (bookwormStatus == QUEST_ACCEPTED and bookNotifications and player:getVar("EARLY_BIRD_TRACK_BOOK") == 0) then
        player:startEvent(0x0186); -- During Quest "Early Bird Catches the Bookworm" 2
    elseif (bookwormStatus == QUEST_ACCEPTED and player:getVar("EARLY_BIRD_TRACK_BOOK") == 1) then
        player:startEvent(0x018d); -- During Quest "Early Bird Catches the Bookworm" 3
    elseif (bookwormStatus == QUEST_ACCEPTED and player:getVar("EARLY_BIRD_TRACK_BOOK") >= 2) then
        player:startEvent(0x0190); -- Finish Quest "Early Bird Catches the Bookworm"
    elseif (bookwormStatus == QUEST_COMPLETED and player:needToZone()) then
        player:startEvent(0x0191); -- Standard dialog before player zone
    elseif (chasingStatus == QUEST_ACCEPTED and player:hasKeyItem(OVERDUE_BOOK_NOTIFICATION) == false) then
        player:startEvent(0x0194,0,126); -- During Quest "Chasing Tales", tells you the book "A Song of Love" is overdue
    elseif (player:hasKeyItem(OVERDUE_BOOK_NOTIFICATION) and player:hasKeyItem(A_SONG_OF_LOVE) == false) then
        player:startEvent(0x0195,0,126);
    elseif (player:getVar("CHASING_TALES_TRACK_BOOK") == 1 and player:hasKeyItem(A_SONG_OF_LOVE) == false) then
        player:startEvent(0x0199);
    elseif (player:hasKeyItem(A_SONG_OF_LOVE)) then
        player:startEvent(0x019a);
    elseif (chasingStatus == QUEST_COMPLETED and player:needToZone() == true) then
        player:startEvent(0x019b);
    -----------------------------------------------------------------
    -- Class Reunion
    elseif (ClassReunion == 1 and ClassReunionProgress >= 3 and talk2 ~= 1) then
        player:startEvent(0x0330); -- he tells you about Uran-Mafran
    -----------------------------------------------------------------
    else
        player:startEvent(0x0173);
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

    if (csid == 0x0185) then
        player:addKeyItem(OVERDUE_BOOK_NOTIFICATIONS);
        player:messageSpecial(KEYITEM_OBTAINED,OVERDUE_BOOK_NOTIFICATIONS);
    elseif (csid == 0x0190) then
        player:needToZone(true);
        player:addTitle(SAVIOR_OF_KNOWLEDGE);
        player:addGil(GIL_RATE*1500);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*1500);
        player:setVar("EARLY_BIRD_TRACK_BOOK",0);
        player:addFame(WINDURST,120);
        player:completeQuest(WINDURST,EARLY_BIRD_CATCHES_THE_BOOKWORM);
    elseif (csid == 0x0194) then
        player:addKeyItem(OVERDUE_BOOK_NOTIFICATION);
        player:messageSpecial(KEYITEM_OBTAINED,OVERDUE_BOOK_NOTIFICATION);
    elseif (csid == 0x019a) then
        player:needToZone(true);
        player:addGil(GIL_RATE*2800);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*2800);
        player:addTitle(SAVIOR_OF_KNOWLEDGE);
        player:delKeyItem(OVERDUE_BOOK_NOTIFICATION);
        player:delKeyItem(A_SONG_OF_LOVE);
        player:setVar("CHASING_TALES_TRACK_BOOK",0);
        player:addFame(WINDURST,120);
        player:completeQuest(WINDURST,CHASING_TALES);
    elseif (csid == 0x0330) then
        player:setVar("ClassReunion_TalkedToFurakku",1);
    end
end;