-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Raimbroy
-- Starts and Finishes Quest: The Sweetest Things
-- !zone 230
-------------------------------------
require("scripts/globals/settings");
local ID = require("scripts/zones/Southern_San_dOria/IDs");
require("scripts/globals/titles");
require("scripts/globals/shop");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE);
    -- "The Sweetest Things" quest status var
    local theSweetestThings = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.THE_SWEETEST_THINGS);

    if (theSweetestThings ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(4370,5) and trade:getItemCount() == 5) then
            player:startEvent(535,GIL_RATE*400);
        else
            player:startEvent(522);
        end
    end

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(ID.text.FLYER_REFUSED);
        end
    end

end;

function onTrigger(player,npc)

    local theSweetestThings = player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.THE_SWEETEST_THINGS);

    -- "The Sweetest Things" Quest Dialogs
    if (player:getFameLevel(SANDORIA) >= 2 and theSweetestThings == QUEST_AVAILABLE) then
        theSweetestThingsVar = player:getVar("theSweetestThings");
        if (theSweetestThingsVar == 1) then
            player:startEvent(533);
        elseif (theSweetestThingsVar == 2) then
            player:startEvent(534);
        else
            player:startEvent(532);
        end
    elseif (theSweetestThings == QUEST_ACCEPTED) then
        player:startEvent(536);
    elseif (theSweetestThings == QUEST_COMPLETED) then
        player:startEvent(537);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    -- "The Sweetest Things" ACCEPTED
    if (csid == 532) then
        player:setVar("theSweetestThings", 1);
    elseif (csid == 533) then
        if (option == 0) then
            player:addQuest(SANDORIA,dsp.quest.id.sandoria.THE_SWEETEST_THINGS);
            player:setVar("theSweetestThings", 0);
        else
            player:setVar("theSweetestThings", 2);
        end
    elseif (csid == 534 and option == 0) then
        player:addQuest(SANDORIA, dsp.quest.id.sandoria.THE_SWEETEST_THINGS);
        player:setVar("theSweetestThings", 0);
    elseif (csid == 535) then
        player:tradeComplete();
        player:addTitle(dsp.title.APIARIST);
        player:addGil(GIL_RATE*400);
        if (player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.THE_SWEETEST_THINGS) == QUEST_ACCEPTED) then
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA, dsp.quest.id.sandoria.THE_SWEETEST_THINGS);
        else
            player:addFame(SANDORIA, 5);
        end
    end

end;