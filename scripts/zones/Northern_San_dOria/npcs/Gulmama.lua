-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Gulmama
-- Starts and Finishes Quest: Trial by Ice
-- Involved in Quest: Class Reunion
-- !pos -186 0 107 231
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
local ID = require("scripts/zones/Northern_San_dOria/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local TrialByIce = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.TRIAL_BY_ICE);
    local WhisperOfFrost = player:hasKeyItem(dsp.ki.WHISPER_OF_FROST);
    local realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day
    local ClassReunion = player:getQuestStatus(WINDURST,dsp.quest.id.windurst.CLASS_REUNION);
    local ClassReunionProgress = player:getCharVar("ClassReunionProgress");

    ------------------------------------------------------------
    -- Class Reunion
    if (ClassReunion == 1 and ClassReunionProgress == 4) then
        player:startEvent(713,0,1171,0,0,0,0,0,0); -- he gives you an ice pendulum and wants you to go to Cloister of Frost
    elseif (ClassReunion == 1 and ClassReunionProgress == 5 and player:hasItem(1171) == false) then
        player:startEvent(712,0,1171,0,0,0,0,0,0); -- lost the ice pendulum need another one
    ------------------------------------------------------------
    elseif ((TrialByIce == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 6) or (TrialByIce == QUEST_COMPLETED and realday ~= player:getCharVar("TrialByIce_date"))) then
        player:startEvent(706,0,dsp.ki.TUNING_FORK_OF_ICE); -- Start and restart quest "Trial by ice"
    elseif (TrialByIce == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.TUNING_FORK_OF_ICE) == false and WhisperOfFrost == false) then
        player:startEvent(718,0,dsp.ki.TUNING_FORK_OF_ICE); -- Defeat against Shiva : Need new Fork
    elseif (TrialByIce == QUEST_ACCEPTED and WhisperOfFrost == false) then
        player:startEvent(707,0,dsp.ki.TUNING_FORK_OF_ICE,4);
    elseif (TrialByIce == QUEST_ACCEPTED and WhisperOfFrost) then
        local numitem = 0;

        if (player:hasItem(17492)) then numitem = numitem + 1; end  -- Shiva's Claws
        if (player:hasItem(13242)) then numitem = numitem + 2; end  -- Ice Belt
        if (player:hasItem(13561)) then numitem = numitem + 4; end  -- Ice Ring
        if (player:hasItem(1207)) then numitem = numitem + 8; end   -- Rust 'B' Gone
        if (player:hasSpell(302)) then numitem = numitem + 32; end  -- Ability to summon Shiva

        player:startEvent(709,0,dsp.ki.TUNING_FORK_OF_ICE,4,0,numitem);
    else
        player:startEvent(710); -- Standard dialog
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 706 and option == 1) then
        if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.TRIAL_BY_ICE) == QUEST_COMPLETED) then
            player:delQuest(SANDORIA,dsp.quest.id.sandoria.TRIAL_BY_ICE);
        end
        player:addQuest(SANDORIA,dsp.quest.id.sandoria.TRIAL_BY_ICE);
        player:setCharVar("TrialByIce_date", 0);
        player:addKeyItem(dsp.ki.TUNING_FORK_OF_ICE);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.TUNING_FORK_OF_ICE);
    elseif (csid == 718) then
        player:addKeyItem(dsp.ki.TUNING_FORK_OF_ICE);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.TUNING_FORK_OF_ICE);
    elseif (csid == 709) then
        local item = 0;
        if (option == 1) then item = 17492;         -- Shiva's Claws
        elseif (option == 2) then item = 13242;  -- Ice Belt
        elseif (option == 3) then item = 13561;  -- Ice Ring
        elseif (option == 4) then item = 1207;     -- Rust 'B' Gone
        end

        if (player:getFreeSlotsCount() == 0 and (option ~= 5 or option ~= 6)) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,item);
        else
            if (option == 5) then
                player:addGil(GIL_RATE*10000);
                player:messageSpecial(ID.text.GIL_OBTAINED,GIL_RATE*10000); -- Gil
            elseif (option == 6) then
                player:addSpell(302); -- Avatar
                player:messageSpecial(ID.text.SHIVA_UNLOCKED,0,0,4);
            else
                player:addItem(item);
                player:messageSpecial(ID.text.ITEM_OBTAINED,item); -- Item
            end
            player:addTitle(dsp.title.HEIR_OF_THE_GREAT_ICE);
            player:delKeyItem(dsp.ki.WHISPER_OF_FROST); --Whisper of Frost, as a trade for the above rewards
            player:setCharVar("TrialByIce_date", os.date("%j")); -- %M for next minute, %j for next day
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,dsp.quest.id.sandoria.TRIAL_BY_ICE);
        end
    elseif (csid == 713 or csid == 712) then
        if (player:getFreeSlotsCount() ~= 0) then
            player:addItem(1171);
            player:messageSpecial(ID.text.ITEM_OBTAINED,1171);
            player:setCharVar("ClassReunionProgress",5);
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,1171);
        end;
    end;

end;
