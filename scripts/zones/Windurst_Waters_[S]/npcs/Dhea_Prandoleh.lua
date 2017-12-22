-----------------------------------
--  Area: Windurst Waters (S)
--   NPC: Dhea Prandoleh
--  Type: Standard NPC
-- @zone 94
-- !pos 1 -1 15
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getCampaignAllegiance() > 0 and player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STIRS) == QUEST_AVAILABLE) then
        player:startEvent(128);
    elseif (player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STIRS) == QUEST_ACCEPTED) then
        player:startEvent(160);
    elseif (player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STIRS) == QUEST_COMPLETED and player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STRIKES) == QUEST_AVAILABLE) then
            player:startEvent(135);
    elseif (player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STRIKES) == QUEST_ACCEPTED) then
        if (player:getVar("TigressStrikesProg") < 3) then
            player:startEvent(131);
        elseif (player:getVar("TigressStrikesProg") == 3) then
            player:startEvent(134);
        end
    else
        player:startEvent(136);
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
    if (csid == 128) then
        player:addQuest(CRYSTAL_WAR, THE_TIGRESS_STIRS);
    elseif (csid == 133) then
        player:addQuest(CRYSTAL_WAR, THE_TIGRESS_STRIKES);
    elseif (csid == 134) then
        player:addItem(139);
        player:messageSpecial(ITEM_OBTAINED,139);
        player:completeQuest(CRYSTAL_WAR, THE_TIGRESS_STRIKES);
        player:needToZone(true);
        player:addTitle(AJIDOMARUJIDOS_MINDER);
    end
end;

