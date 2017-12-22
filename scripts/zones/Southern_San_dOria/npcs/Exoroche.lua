-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Exoroche
-- Involved in Quests: Father and Son, A Boy's Dream
-- @zone 230
-- !pos 72 -1 60

-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

--    player:startEvent(79)  -- how the paper works -- under oath
--    player:startEvent(51)  -- it says what i dont beleive you -- under oath
--    player:startEvent(19)  -- thanks for your help i have to tell trion -- under oath
--     player:startEvent(77)    -- a boys dream
-- "Father and Son" Event Dialogs
    if (player:getQuestStatus(SANDORIA,FATHER_AND_SON) == QUEST_ACCEPTED) then
        player:startEvent(542);
    elseif (player:getVar("aBoysDreamCS") == 2) then
        player:startEvent(50);
    elseif (player:getVar("aBoysDreamCS") >= 7) then
        player:startEvent(32);
    elseif (player:getVar("UnderOathCS") == 4 and player:hasKeyItem(STRANGE_SHEET_OF_PAPER)) then
        player:startEvent(77);
    elseif (player:getVar("UnderOathCS") == 5) then
        player:startEvent(79);
    elseif (player:hasKeyItem(KNIGHTS_CONFESSION) and player:getVar("UnderOathCS") == 6) then
        player:startEvent(51);
    elseif (player:getVar("UnderOathCS") == 8) then
        player:startEvent(19);
    else
        player:startEvent(76);
    end;

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
    if (csid == 542) then
        player:setVar("QuestfatherAndSonVar",1);
    elseif (csid == 50) then
        player:setVar("aBoysDreamCS",3);
    elseif (csid == 32 and player:getVar("aBoysDreamCS") == 7) then
        player:setVar("aBoysDreamCS",8);
    elseif (csid == 77) then
        player:setVar("UnderOathCS",5)
    end
end;
------- used in expansions
--    player:startEvent(946)  -- you want to hear of my father go talk to albieche
--    player:startEvent(947) -- trainees spectacles