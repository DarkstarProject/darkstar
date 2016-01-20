-----------------------------------
-- Area: Bastok Markets
-- NPC: Ardea
-- @zone 235
-- @pos -198 -6 -69
-- Involved in quests: Chasing Quotas, Rock Racketeer
-- Standard Info NPC
-----------------------------------


package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
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

    local RockRacketeer = player:getQuestStatus(WINDURST,ROCK_RACKETTER);
    local Quotas_Status = player:getVar("ChasingQuotas_Progress");

    -- Rock Racketeer
    if (RockRacketeer == QUEST_ACCEPTED and player:hasKeyItem(SHARP_GRAY_STONE)) then
        player:startEvent(0x0105);
    elseif (Quotas_Status == 3) then
        player:startEvent(264); -- Someone was just asking about that earring.
    elseif (Quotas_Status == 4) then
        player:startEvent(265); -- They'll be happy if you return it.
    -- Standard dialog
    else
        player:startEvent(0x104);
    end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    -- Rock Racketeer
    if (csid == 0x0105 and option ~= 1) then
        player:delKeyItem(SHARP_GRAY_STONE);
        player:addGil(GIL_RATE*10);
        player:setVar("rockracketeer_sold",1);
    elseif (csid == 0x0105 and option ~= 2) then
        player:setVar("rockracketeer_sold",2);
    elseif (csid == 264) then
        player:setVar("ChasingQuotas_Progress",4);
    end

end;



