-----------------------------------
-- Area: Beaucedine Glacier
--  NPC: Torino-Samarino
-- Type: Quest NPC
--     Involved in Quests: Curses, Foiled A-Golem!?, Tuning Out
-- !pos 105 -20 140 111
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
local ID = require("scripts/zones/Beaucedine_Glacier/IDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local FoiledAGolem = player:getQuestStatus(WINDURST,dsp.quest.id.windurst.CURSES_FOILED_A_GOLEM);

    -- Curses, Foiled A_Golem!?
    if (player:hasKeyItem(dsp.ki.SHANTOTTOS_EXSPELL) and FoiledAGolem == QUEST_ACCEPTED) then
        player:startEvent(108); -- key item taken, wait one game day for new spell
    elseif (player:getCharVar("golemwait") == 1 and FoiledAGolem == QUEST_ACCEPTED) then
        local gDay = VanadielDayOfTheYear();
        local gYear = VanadielYear();
        local dFinished = player:getCharVar("golemday");
        local yFinished = player:getCharVar("golemyear");
        if (gDay == dFinished and gYear == yFinished) then
            player:startEvent(113); -- re-write reminder
        elseif (gDay == dFinished + 1 and gYear == yFinished) then
            player:startEvent(109); -- re-write done
        end
    elseif (player:getCharVar("foiledagolemdeliverycomplete") == 1) then
        player:startEvent(110); -- talk to Shantotto reminder
    elseif (FoiledAGolem == QUEST_ACCEPTED) then
        player:startEvent(104); -- receive key item
    else
        player:startEvent(101); -- standard dialog
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    -- Curses, Foiled A_Golem!?
    if (csid == 104 and option == 1) then
        player:addKeyItem(dsp.ki.SHANTOTTOS_NEW_SPELL);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SHANTOTTOS_NEW_SPELL);  -- add new spell key item
    elseif (csid == 108) then                                       -- start wait for new scroll
        player:delKeyItem(dsp.ki.SHANTOTTOS_EXSPELL);
        player:setCharVar("golemday",VanadielDayOfTheYear());
        player:setCharVar("golemyear",VanadielYear());
        player:setCharVar("golemwait",1);
    elseif (csid == 109) then
        player:addKeyItem(dsp.ki.SHANTOTTOS_NEW_SPELL);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SHANTOTTOS_NEW_SPELL);  -- add new spell key item
        player:setCharVar("golemday",0);
        player:setCharVar("golemyear",0);
        player:setCharVar("golemwait",0);
    end
end;