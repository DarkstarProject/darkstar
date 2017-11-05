-----------------------------------
--  Area: Oldton Movalpolos
--  NPC:  Koblakiq
--  Type: NPC Quest
--  !pos -64.851 21.834 -117.521 11
-----------------------------------
package.loaded["scripts/zones/Oldton_Movalpolos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Oldton_Movalpolos/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(OTHER_AREAS,MISSIONARY_MOBLIN) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(1686,1) and trade:getItemCount() == 1) then
            player:startEvent(0x0009);
        end
    elseif (player:getQuestStatus(OTHER_AREAS,BETTER_THE_DEMON_YOU_KNOW) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(1653,1) and trade:getItemCount() == 1) then
            player:startEvent(0x0016);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local MissionaryMoblin = player:getQuestStatus(OTHER_AREAS,MISSIONARY_MOBLIN);
    local ForTheBirds = player:getQuestStatus(OTHER_AREAS,FOR_THE_BIRDS);
    local BetterTheDemonYouKnow = player:getQuestStatus(OTHER_AREAS,BETTER_THE_DEMON_YOU_KNOW);
    local NeedToZone = player:needToZone();
    local BirdsVar = player:getVar("ForTheBirdsQuest");
    local transReady = player:getVar("DemonTranslationReady");
    local DemonVar = player:getVar("BetterTheDemonYouKnowQuest");
    local Earplug = player:hasKeyItem(ZEELOZOKS_EARPLUG);

    if (BetterTheDemonYouKnow == QUEST_COMPLETED) then
        player:startEvent(0x001b);
    elseif (BetterTheDemonYouKnow == QUEST_ACCEPTED and Earplug == true and DemonVar == 3) then
        player:startEvent(0x001a);
    elseif (BetterTheDemonYouKnow == QUEST_ACCEPTED and DemonVar == 2) then
        player:startEvent(0x0019);
    elseif (BetterTheDemonYouKnow == QUEST_ACCEPTED and DemonVar == 1) then
        if (os.time() >= transReady) then
            player:startEvent(0x0018);
        else
            player:startEvent(0x0017);
        end
    elseif (BetterTheDemonYouKnow == QUEST_ACCEPTED) then
        player:startEvent(0x0015,0,1653);
    elseif (ForTheBirds == QUEST_COMPLETED) then
        if (NeedToZone == false) then
            player:startEvent(0x0014,0,1653);
        else
            player:startEvent(0x0013);
        end
    elseif (ForTheBirds == QUEST_ACCEPTED and BirdsVar == 3) then
        player:startEvent(0x0012);
    elseif (ForTheBirds == QUEST_ACCEPTED and BirdsVar == 2) then
        player:startEvent(0x0011);
    elseif (ForTheBirds == QUEST_ACCEPTED and BirdsVar == 1) then
        player:startEvent(0x0010);
    elseif (ForTheBirds == QUEST_ACCEPTED) then
        player:startEvent(0x000f,0,1663);
    elseif (MissionaryMoblin == QUEST_COMPLETED) then
        if (NeedToZone == false) then
            player:startEvent(0x000e,0,1663);
        else
            player:startEvent(0x000c);
        end
    elseif (MissionaryMoblin == QUEST_ACCEPTED) then
        player:startEvent(0x0008);
    elseif (MissionaryMoblin == QUEST_AVAILABLE) then
        player:startEvent(0x0007);
    else
        player:startEvent(0x000d);
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

    if (csid == 0x0007 and option == 1) then
        player:addQuest(OTHER_AREAS,MISSIONARY_MOBLIN);
    elseif (csid == 0x0009) then
        player:tradeComplete();
        player:addGil(GIL_RATE*4000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*4000);
        player:completeQuest(OTHER_AREAS,MISSIONARY_MOBLIN);
        player:needToZone(true);
    elseif (csid == 0x000e and option == 1) then
        player:addQuest(OTHER_AREAS,FOR_THE_BIRDS);
    elseif (csid == 0x0010) then
        player:addKeyItem(GLITTERING_FRAGMENT);
        player:messageSpecial(KEYITEM_OBTAINED,GLITTERING_FRAGMENT);
        player:setVar("ForTheBirdsQuest",2);
    elseif (csid == 0x0012) then
        player:completeQuest(OTHER_AREAS,FOR_THE_BIRDS);
        player:addItem(13686, 1);
        player:messageSpecial(ITEM_OBTAINED,13686);
        player:setVar("ForTheBirdsQuest",0);
        player:needToZone(true);
    elseif (csid == 0x0014) then
        player:addQuest(OTHER_AREAS,BETTER_THE_DEMON_YOU_KNOW);
    elseif (csid == 0x0016) then
        player:tradeComplete();
        player:setVar("DemonTranslationReady",os.time() + 60);
        player:setVar("BetterTheDemonYouKnowQuest",1);
    elseif (csid == 0x0018) then
        player:setVar("BetterTheDemonYouKnowQuest",2);
        player:setVar("DemonTranslationReady",0);
    elseif (csid == 0x001a) then
        player:completeQuest(OTHER_AREAS,BETTER_THE_DEMON_YOU_KNOW);
        player:delKeyItem(ZEELOZOKS_EARPLUG);
        player:addItem(18180, 1);
        player:messageSpecial(ITEM_OBTAINED,18180);
        player:setVar("BetterTheDemonYouKnowQuest",0);
        player:setTitle(APOSTATE_FOR_HIRE);
    end
end;