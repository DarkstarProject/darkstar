-----------------------------------
-- Area: South Gustaberg
--  NPC: Cavernous Maw
-- @pos 340 -0.5 -680
-- Teleports Players to Abyssea - Altepa
-----------------------------------
package.loaded["scripts/zones/South_Gustaberg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/abyssea");
require("scripts/zones/South_Gustaberg/TextIDs");

-----------------------------------

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
        and player:getQuestStatus(ABYSSEA, A_BEAKED_BLUSTERER) == QUEST_AVAILABLE) then
            player:startEvent(0);
        else
            player:startEvent(914,0,1); -- No param = no entry.
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
        player:addQuest(ABYSSEA, A_BEAKED_BLUSTERER);
    elseif (csid == 1) then
        -- Killed Bennu
    elseif (csid == 914 and option == 1) then
        player:setPos(432, 0, 321, 125, 218);
    end
end;