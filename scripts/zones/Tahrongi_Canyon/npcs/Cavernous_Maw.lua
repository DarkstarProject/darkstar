-----------------------------------
-- Area: Tahrongi Canyon
--  NPC: Cavernous Maw
-- @pos -28.597, 46.056, -685.754 117
-- Teleports Players to Abyssea - Tahrongi
-----------------------------------
package.loaded["scripts/zones/Tahrongi_Canyon/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/abyssea");
require("scripts/zones/Tahrongi_Canyon/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (ENABLE_ABYSSEA == 1 and player:getMainLvl() >= 30) then
        local HasStone = getTravStonesTotal(player);
        if (HasStone >= 1 and player:getQuestStatus(ABYSSEA, DAWN_OF_DEATH) == QUEST_ACCEPTED
        and player:getQuestStatus(ABYSSEA, MEGADRILE_MENACE) == QUEST_AVAILABLE) then
            player:startEvent(38);
        else
            player:startEvent(100,0,1); -- No param = no entry.
        end
    else
        player:messageSpecial(NOTHING_HAPPENS);
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
    if (csid == 38) then
        player:addQuest(ABYSSEA, MEGADRILE_MENACE);
    elseif (csid == 39) then
        -- Killed Glavoid
    elseif (csid == 100 and option == 1) then
        player:setPos(-24,44,-678,240,45);
    end
end;