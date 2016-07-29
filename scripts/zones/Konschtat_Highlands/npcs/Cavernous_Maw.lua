-----------------------------------
-- Area: Konschtat Highlands
--  NPC: Cavernous Maw
-- @pos 96.344, -69.080, -580.008 108
-- Teleports Players to Abyssea - Konschtat
-----------------------------------
package.loaded["scripts/zones/Konschtat_Highlands/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/abyssea");
require("scripts/zones/Konschtat_Highlands/TextIDs");

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
        and player:getQuestStatus(ABYSSEA, TO_PASTE_A_PEISTE) == QUEST_AVAILABLE) then
            player:startEvent(0);
        else
            player:startEvent(107,0,1); -- No param = no entry.
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
    if (csid == 0) then
        player:addQuest(ABYSSEA, TO_PASTE_A_PEISTE);
    elseif (csid == 1) then
        -- Killed Kukulkan
    elseif (csid == 107 and option == 1) then
        player:setPos(153,-72,-840,140,15);
    end
end;