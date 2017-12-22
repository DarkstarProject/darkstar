-----------------------------------
--  Area: Bastok Markets
--  NPC:  Horatius
--  Type: Quest Giver
--  Starts and Finishes: Breaking Stones
-- !pos -158.392 -5.839 -117.061 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(BASTOK,BREAKING_STONES) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(553,1) and trade:getItemCount() == 1) then
            player:startEvent(101);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local WildcatBastok = player:getVar("WildcatBastok");

    if (player:getQuestStatus(BASTOK,LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,12) == false) then
        player:startEvent(428);
    elseif (player:getQuestStatus(BASTOK,BREAKING_STONES) == QUEST_AVAILABLE and player:getFameLevel(BASTOK) >= 2) then
        player:startEvent(100);
    else
        player:startEvent(110);
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
     --printf("CSID: %u",csid);
     --printf("RESULT: %u",option);

    if (csid == 100 and option == 0) then
        player:addQuest(BASTOK,BREAKING_STONES);
    elseif (csid == 101) then
        player:tradeComplete();
        player:addGil(GIL_RATE*400);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*400);
        player:completeQuest(BASTOK,BREAKING_STONES);
    elseif (csid == 428) then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",12,true);
    end

end;

