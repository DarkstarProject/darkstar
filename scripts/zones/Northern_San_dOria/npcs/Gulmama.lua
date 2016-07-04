-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Gulmama
-- Starts and Finishes Quest: Trial by Ice
-- Involved in Quest: Class Reunion
-- @pos -186 0 107 231
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local TrialByIce = player:getQuestStatus(SANDORIA,TRIAL_BY_ICE);
    local WhisperOfFrost = player:hasKeyItem(WHISPER_OF_FROST);
    local realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day
    local ClassReunion = player:getQuestStatus(WINDURST,CLASS_REUNION);
    local ClassReunionProgress = player:getVar("ClassReunionProgress");

    ------------------------------------------------------------
    -- Class Reunion
    if (ClassReunion == 1 and ClassReunionProgress == 4) then
        player:startEvent(0x02c9,0,1171,0,0,0,0,0,0); -- he gives you an ice pendulum and wants you to go to Cloister of Frost
    elseif (ClassReunion == 1 and ClassReunionProgress == 5 and player:hasItem(1171) == false) then
        player:startEvent(0x02c8,0,1171,0,0,0,0,0,0); -- lost the ice pendulum need another one
    ------------------------------------------------------------
    elseif ((TrialByIce == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 6) or (TrialByIce == QUEST_COMPLETED and realday ~= player:getVar("TrialByIce_date"))) then 
        player:startEvent(0x02c2,0,TUNING_FORK_OF_ICE); -- Start and restart quest "Trial by ice"
    elseif (TrialByIce == QUEST_ACCEPTED and player:hasKeyItem(TUNING_FORK_OF_ICE) == false and WhisperOfFrost == false) then 
        player:startEvent(0x02ce,0,TUNING_FORK_OF_ICE); -- Defeat against Shiva : Need new Fork
    elseif (TrialByIce == QUEST_ACCEPTED and WhisperOfFrost == false) then 
        player:startEvent(0x02c3,0,TUNING_FORK_OF_ICE,4);
    elseif (TrialByIce == QUEST_ACCEPTED and WhisperOfFrost) then 
        local numitem = 0;
        
        if (player:hasItem(17492)) then numitem = numitem + 1; end  -- Shiva's Claws
        if (player:hasItem(13242)) then numitem = numitem + 2; end  -- Ice Belt
        if (player:hasItem(13561)) then numitem = numitem + 4; end  -- Ice Ring
        if (player:hasItem(1207)) then numitem = numitem + 8; end   -- Rust 'B' Gone
        if (player:hasSpell(302)) then numitem = numitem + 32; end  -- Ability to summon Shiva    
        
        player:startEvent(0x02c5,0,TUNING_FORK_OF_ICE,4,0,numitem);
    else 
        player:startEvent(0x02c6); -- Standard dialog
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
    
    if (csid == 0x02c2 and option == 1) then
        if (player:getQuestStatus(SANDORIA,TRIAL_BY_ICE) == QUEST_COMPLETED) then
            player:delQuest(SANDORIA,TRIAL_BY_ICE);
        end
        player:addQuest(SANDORIA,TRIAL_BY_ICE);
        player:setVar("TrialByIce_date", 0);
        player:addKeyItem(TUNING_FORK_OF_ICE);
        player:messageSpecial(KEYITEM_OBTAINED,TUNING_FORK_OF_ICE);
    elseif (csid == 0x02ce) then 
        player:addKeyItem(TUNING_FORK_OF_ICE);
        player:messageSpecial(KEYITEM_OBTAINED,TUNING_FORK_OF_ICE);
    elseif (csid == 0x02c5) then
        local item = 0;
        if (option == 1) then item = 17492;         -- Shiva's Claws
        elseif (option == 2) then item = 13242;  -- Ice Belt
        elseif (option == 3) then item = 13561;  -- Ice Ring
        elseif (option == 4) then item = 1207;     -- Rust 'B' Gone
        end
        
        if (player:getFreeSlotsCount() == 0 and (option ~= 5 or option ~= 6)) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,item);
        else 
            if (option == 5) then 
                player:addGil(GIL_RATE*10000);
                player:messageSpecial(GIL_OBTAINED,GIL_RATE*10000); -- Gil
            elseif (option == 6) then 
                player:addSpell(302); -- Avatar
                player:messageSpecial(SHIVA_UNLOCKED,0,0,4);
            else
                player:addItem(item);
                player:messageSpecial(ITEM_OBTAINED,item); -- Item
            end
            player:addTitle(HEIR_OF_THE_GREAT_ICE);
            player:delKeyItem(WHISPER_OF_FROST); --Whisper of Frost, as a trade for the above rewards
            player:setVar("TrialByIce_date", os.date("%j")); -- %M for next minute, %j for next day
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,TRIAL_BY_ICE);
        end
    elseif (csid == 0x02c9 or csid == 0x02c8) then
        if (player:getFreeSlotsCount() ~= 0) then
            player:addItem(1171);
            player:messageSpecial(ITEM_OBTAINED,1171);
            player:setVar("ClassReunionProgress",5);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1171);
        end;
    end;
    
end;
