-----------------------------------
-- Area: Bastok Markets
--  NPC: Degenhard
-- Starts & Ends Quest: The Bare Bones
-- Involved in Quests: Beat Around the Bushin
-- !pos -175 2 -135 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local count = trade:getItemCount();
    local BoneChip = trade:hasItemQty(880,1);
    if (BoneChip == true and count == 1) then
        local BareBones = player:getQuestStatus(BASTOK,THE_BARE_BONES);
        if (BareBones == 1) then
            player:tradeComplete();
            player:completeQuest(BASTOK,THE_BARE_BONES);
            player:startEvent(258);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local BareBones = player:getQuestStatus(BASTOK,THE_BARE_BONES);
    if (player:getVar("BeatAroundTheBushin") == 3) then
        player:startEvent(342);
    elseif (BareBones == 0) then
        player:startEvent(256);
    else
        player:startEvent(255);
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
    if (csid == 342) then
        player:setVar("BeatAroundTheBushin",4);
    elseif (csid == 256) then
        player:addQuest(BASTOK,THE_BARE_BONES);
    elseif (csid == 258) then
        player:addKeyItem(0x188);
        player:messageSpecial(KEYITEM_OBTAINED,0x188);
        player:addFame(BASTOK,60);
    end
end;
