-----------------------------------
-- Area: Upper Jeuno
-- NPC: Brutus
-- Starts Quest: Chocobo's Wounds, Save My Son, Path of the Beastmaster, Wings of gold, Scattered into Shadow, Chocobo on the Loose!
-- @pos -55 8 95 244
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Upper_Jeuno/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
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

    local chocoboOnTheLoose = player:getQuestStatus(JEUNO,CHOCOBO_ON_THE_LOOSE);
    local chocoboOnTheLooseStatus = player:getVar("ChocoboOnTheLoose");
    local ChocobosWounds = player:getQuestStatus(JEUNO,CHOCOBO_S_WOUNDS);
    local saveMySon = player:getQuestStatus(JEUNO,SAVE_MY_SON);
    local wingsOfGold = player:getQuestStatus(JEUNO,WINGS_OF_GOLD);
    local scatIntoShadow = player:getQuestStatus(JEUNO,SCATTERED_INTO_SHADOW);
    
    local mLvl = player:getMainLvl();
    local mJob = player:getMainJob();
    
    if (chocoboOnTheLoose == QUEST_AVAILABLE) then
        player:startEvent(0x276D);
    elseif (chocoboOnTheLoose == QUEST_ACCEPTED and chocoboOnTheLooseStatus == 0) then
        player:startEvent(0x276E);
    elseif (chocoboOnTheLoose == QUEST_ACCEPTED and chocoboOnTheLooseStatus == 2) then
        player:startEvent(0x276F);
    elseif (chocoboOnTheLoose == QUEST_ACCEPTED and chocoboOnTheLooseStatus == 3) then
        player:startEvent(0x2773);
    elseif (chocoboOnTheLoose == QUEST_ACCEPTED and (chocoboOnTheLooseStatus == 5 or chocoboOnTheLooseStatus == 6)) then
        player:startEvent(0x2774);
    elseif (chocoboOnTheLoose == QUEST_ACCEPTED and chocoboOnTheLooseStatus == 7 and player:needToZone() == false and (player:getVar("ChocoboOnTheLooseDay") < VanadielDayOfTheYear() or player:getVar("ChocoboOnTheLooseYear") < VanadielYear())) then
        player:startEvent(0x277D);
    elseif (player:getMainLvl() >= 20 and ChocobosWounds ~= QUEST_COMPLETED) then
        local chocoFeed = player:getVar("ChocobosWounds_Event");
    
        if (ChocobosWounds == QUEST_AVAILABLE) then
            player:startEvent(0x0047);
        elseif (chocoFeed == 1) then
            player:startEvent(0x0041);
        elseif (chocoFeed == 2) then
            player:startEvent(0x0042);
        else
            player:startEvent(0x0066);
        end
    elseif (ChocobosWounds == QUEST_COMPLETED and saveMySon == QUEST_AVAILABLE) then
        player:startEvent(0x0016);
    elseif (saveMySon == QUEST_COMPLETED and player:getQuestStatus(JEUNO,PATH_OF_THE_BEASTMASTER) == QUEST_AVAILABLE) then
        player:startEvent(0x0046);
    elseif (mLvl >= AF1_QUEST_LEVEL and mJob == 9 and wingsOfGold == QUEST_AVAILABLE) then
        if (player:getVar("wingsOfGold_shortCS") == 1) then
            player:startEvent(0x0089); -- Start Quest "Wings of gold" (Short dialog)
        else
            player:setVar("wingsOfGold_shortCS",1);
            player:startEvent(0x008b); -- Start Quest "Wings of gold" (Long dialog)
        end
    elseif (wingsOfGold == QUEST_ACCEPTED) then
        if (player:hasKeyItem(GUIDING_BELL) == false) then
            player:startEvent(0x0088);
        else
            player:startEvent(0x008a); -- Finish Quest "Wings of gold"
        end
    elseif (wingsOfGold == QUEST_COMPLETED and mLvl < AF2_QUEST_LEVEL and mJob == 9) then
        player:startEvent(0x0086); -- Standard dialog after "Wings of gold"
    elseif (scatIntoShadow == QUEST_AVAILABLE and mLvl >= AF2_QUEST_LEVEL and mJob == 9) then
        if (player:getVar("scatIntoShadow_shortCS") == 1) then
            player:startEvent(0x008f);
        else
            player:setVar("scatIntoShadow_shortCS",1);
            player:startEvent(0x008d);
        end
    elseif (scatIntoShadow == QUEST_ACCEPTED) then
        local scatIntoShadowCS = player:getVar("scatIntoShadowCS");
        if (player:hasKeyItem(AQUAFLORA1) or player:hasKeyItem(AQUAFLORA2) or player:hasKeyItem(AQUAFLORA3)) then
            player:startEvent(0x008e);
        elseif (scatIntoShadowCS == 0) then
            player:startEvent(0x0090);
        elseif (scatIntoShadowCS == 1) then
            player:startEvent(0x0095);
        elseif (scatIntoShadowCS == 2) then
            player:startEvent(0x0087);
        end
    elseif (scatIntoShadow == QUEST_COMPLETED) then
        player:startEvent(0x0097);
    elseif (player:getQuestStatus(JEUNO,PATH_OF_THE_BEASTMASTER) == QUEST_COMPLETED) then
        player:startEvent(0x0014);
    else
        player:startEvent(0x0042, player:getMainLvl());
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

    if (csid == 0x276D) then
        player:addQuest(JEUNO,CHOCOBO_ON_THE_LOOSE);
    elseif (csid == 0x276E) then
        player:setVar("ChocoboOnTheLoose", 1);
    elseif (csid == 0x276F) then
        player:setVar("ChocoboOnTheLoose", 3);
    elseif (csid == 0x2773) then
        player:setVar("ChocoboOnTheLoose", 4);
    elseif (csid == 0x2774) then
        player:setVar("ChocoboOnTheLoose", 7);
        player:setVar("ChocoboOnTheLooseDay", VanadielDayOfTheYear());
        player:setVar("ChocoboOnTheLooseYear", VanadielYear());
        player:needToZone(true);
    elseif (csid == 0x277D) then
        player:setVar("ChocoboOnTheLoose", 0);
        player:setVar("ChocoboOnTheLooseDay", 0);
        player:setVar("ChocoboOnTheLooseYear", 0);
        player:addFame(JEUNO, 30);
        player:addItem(2317);
        player:messageSpecial(ITEM_OBTAINED,2317); -- Chocobo Egg (a bit warm)
        player:completeQuest(JEUNO,CHOCOBO_ON_THE_LOOSE);
    elseif (csid == 0x0047 and option == 1) then
        player:addQuest(JEUNO,CHOCOBO_S_WOUNDS);
        player:setVar("ChocobosWounds_Event",1);
    elseif (csid == 0x0046) then
        player:addQuest(JEUNO,PATH_OF_THE_BEASTMASTER);
        player:addTitle(ANIMAL_TRAINER);
        player:unlockJob(9); -- Beastmaster
        player:messageSpecial(YOU_CAN_NOW_BECOME_A_BEASTMASTER);
        player:addFame(JEUNO, 30);
        player:completeQuest(JEUNO,PATH_OF_THE_BEASTMASTER);
    elseif ((csid == 0x008b or csid == 0x0089) and option == 1) then
        player:addQuest(JEUNO,WINGS_OF_GOLD);
        player:setVar("wingsOfGold_shortCS",0);
    elseif (csid == 0x008a) then
        if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16680);
        else
            player:delKeyItem(GUIDING_BELL);
            player:addItem(16680);
            player:messageSpecial(ITEM_OBTAINED,16680); -- Barbaroi Axe
            player:addFame(JEUNO,AF1_FAME);
            player:completeQuest(JEUNO,WINGS_OF_GOLD);
        end
    elseif ((csid == 0x008f or csid == 0x008d) and option == 1) then
        player:addQuest(JEUNO,SCATTERED_INTO_SHADOW);
        player:setVar("scatIntoShadow_shortCS",0);
        player:addKeyItem(AQUAFLORA1);
        player:addKeyItem(AQUAFLORA2);
        player:addKeyItem(AQUAFLORA3);
        player:messageSpecial(KEYITEM_OBTAINED,AQUAFLORA1);
    elseif (csid == 0x0090) then
        player:setVar("scatIntoShadowCS",1);
    elseif (csid == 0x0087) then
        if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14097);
        else
            player:setVar("scatIntoShadowCS",0);
            player:addItem(14097);
            player:messageSpecial(ITEM_OBTAINED,14097); -- Beast Gaiters
            player:addFame(JEUNO,AF2_FAME);
            player:completeQuest(JEUNO,SCATTERED_INTO_SHADOW);
        end
    end
end;
