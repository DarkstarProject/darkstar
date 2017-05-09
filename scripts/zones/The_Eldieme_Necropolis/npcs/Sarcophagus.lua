-----------------------------------
-- Area: The Eldieme Necropolis
-- NPC: Sarcophagus
-- Involved in Quests: The Requiem (BARD AF2), A New Dawn (BST AF3)
-- @pos -420 8 500 195
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/zones/The_Eldieme_Necropolis/MobIDs");
require("scripts/zones/The_Eldieme_Necropolis/TextIDs");

-----------------------------------
-- sarcophagusNumber
-----------------------------------

function sarcophagusNumber(X,Z)
    if (X <= -423 and X >= -426 and Z >= 494 and Z <= 499) then
        return 1;
    elseif (X <= -418 and X >= -423 and Z >= 500 and Z <= 505) then
        return 2;
    elseif (X <= -415 and X >= -418 and Z >= 500 and Z <= 505) then
        return 3;
    elseif (X <= -410 and X >= -415 and Z >= 500 and Z <= 505) then
        return 4;
    elseif (X <= -410 and X >= -415 and Z >= 494 and Z <= 499) then
        return 5;
    end;
end;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    -- THE REQUIEM (holy water)
    if (player:getVar("TheRequiemCS") == 3 and trade:hasItemQty(4154,1) and trade:getItemCount() == 1) then 
        if (sarcophagusNumber(npc:getXPos(),npc:getZPos()) == player:getVar("TheRequiemRandom") and player:getVar("TheRequiemYumKilled") == 0 and GetMobByID(YUM_KIMIL):isDead()) then
            player:tradeComplete();
            player:messageSpecial(SENSE_OF_FOREBODING);
            player:setVar("TheRequiemAlreadyPoped",1);
            for i = YUM_KIMIL, OWL_GUARDIAN do
                if (GetMobByID(i):isDead()) then
                    SpawnMob(i):updateClaim(player); -- spawn yum kimil and its two guardians
                end;
            end;
        else
            player:messageSpecial(NOTHING_HAPPENED);
        end;
    end;
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local ANewDawn = player:getQuestStatus(JEUNO,A_NEW_DAWN);
    local ANewDawnEvent = player:getVar("ANewDawn_Event");
    
    -- A NEW DAWN (Beastmaster AF3)
    if (sarcophagusNumber(npc:getXPos(),npc:getZPos()) == 4 and ANewDawn == QUEST_ACCEPTED) then
        if (ANewDawnEvent == 4) then
            for i = STURM, TROMBE do 
                if (GetMobByID(i):isDead()) then
                    SpawnMob(i):updateClaim(player); -- spawn sturm and its two guardians
                end;
            end;
        elseif (ANewDawnEvent == 5) then
            player:startEvent(45);
        end;
    
    -- THE REQUIEM (Bard AF2)
    elseif (sarcophagusNumber(npc:getXPos(),npc:getZPos()) == player:getVar("TheRequiemRandom")) then
        if (player:getVar("TheRequiemYumKilled") == 1) then
            player:startEvent(46);
        elseif (player:getVar("TheRequiemAlreadyPoped") == 1 and GetMobByID(YUM_KIMIL):isDead()) then
            player:messageSpecial(SENSE_OF_FOREBODING);
            for i = YUM_KIMIL, OWL_GUARDIAN do
                if (GetMobByID(i):isDead()) then
                    SpawnMob(i):updateClaim(player);
                end;
            end;
        else
            player:messageSpecial(SARCOPHAGUS_CANNOT_BE_OPENED);
        end;
        
    -- DEFAULT DIALOG
    else
        player:messageSpecial(SARCOPHAGUS_CANNOT_BE_OPENED);
    end;
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- THE REQUIEM
    if (csid == 46) then
        player:setVar("TheRequiemCS",0);
        player:setVar("TheRequiemYumKilled",0);
        player:setVar("TheRequiemRandom",0);
        player:setVar("TheRequiemAlreadyPoped",0);
        player:addKeyItem(STAR_RING1);
        player:messageSpecial(KEYITEM_OBTAINED,STAR_RING1); -- Star Ring (Key Item).

    -- A NEW DAWN
    elseif (csid == 45) then
        player:setVar("ANewDawn_Event",6);
        player:delKeyItem(217);
        player:addTitle(196);
        player:addItem(14222,1);
        player:messageSpecial(ITEM_OBTAINED,14222);
        player:completeQuest(JEUNO,A_NEW_DAWN);
        player:addFame(JEUNO, 30);
    end;
end;
