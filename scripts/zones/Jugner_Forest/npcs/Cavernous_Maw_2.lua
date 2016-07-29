-----------------------------------
-- Area: Jugner Forest
--  NPC: Cavernous Maw
-- @pos 246.318, -0.709, 5.706 104
-- Teleports Players to Abyssea - Vunkerl
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/abyssea");
require("scripts/zones/Jugner_Forest/TextIDs");

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
        and player:getQuestStatus(ABYSSEA, THE_BEAST_OF_BASTORE) == QUEST_AVAILABLE) then
            player:startEvent(48);
        else
            player:startEvent(47,0,1); -- No param = no entry.
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
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 48) then
        player:addQuest(ABYSSEA, THE_BEAST_OF_BASTORE);
    elseif (csid == 49) then
        -- Killed Sedna
    elseif (csid == 47 and option == 1) then
        player:setPos(-351,-46.750,699.5,10,217);
    end
end;