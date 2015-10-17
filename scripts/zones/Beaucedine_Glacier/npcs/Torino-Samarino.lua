-----------------------------------
--  Area: Beaucedine Glacier
--  NPC:  Torino-Samarino
--  Type: Quest NPC
-- 	Involved in Quests: Curses, Foiled A-Golem!?, Tuning Out
--  @pos 105 -20 140 111
-----------------------------------

package.loaded["scripts/zones/Beaucedine_Glacier/TextIDs"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Beaucedine_Glacier/TextIDs");
require("scripts/globals/keyitems");

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

    local FoiledAGolem = player:getQuestStatus(WINDURST,CURSES_FOILED_A_GOLEM);

    -- Curses, Foiled A_Golem!?
    if (player:hasKeyItem(SHANTOTTOS_EXSPELL) and FoiledAGolem == QUEST_ACCEPTED) then
        player:startEvent(0x006C); -- key item taken, wait one game day for new spell
    elseif (player:getVar("golemwait") == 1 and FoiledAGolem == QUEST_ACCEPTED) then
        local gDay = VanadielDayOfTheYear();
        local gYear = VanadielYear();
        local dFinished = player:getVar("golemday");
        local yFinished = player:getVar("golemyear");
        if (gDay == dFinished and gYear == yFinished) then
            player:startEvent(0x0071); -- re-write reminder
        elseif (gDay == dFinished + 1 and gYear == yFinished) then
            player:startEvent(0x006D); -- re-write done
        end
    elseif (player:getVar("foiledagolemdeliverycomplete") == 1) then
        player:startEvent(0x006E); -- talk to Shantotto reminder
    elseif (FoiledAGolem == QUEST_ACCEPTED) then
        player:startEvent(0x0068); -- receive key item
    else
        player:startEvent(0x0065); -- standard dialog
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

    -- Curses, Foiled A_Golem!?
    if (csid == 0x0068 and option == 1) then
        player:addKeyItem(SHANTOTTOS_NEW_SPELL);
        player:messageSpecial(KEYITEM_OBTAINED,SHANTOTTOS_NEW_SPELL);  -- add new spell key item
    elseif (csid == 0x006C) then                                       -- start wait for new scroll
        player:delKeyItem(SHANTOTTOS_EXSPELL);
        player:setVar("golemday",VanadielDayOfTheYear());
        player:setVar("golemyear",VanadielYear());
        player:setVar("golemwait",1);
    elseif (csid == 0x006D) then
        player:addKeyItem(SHANTOTTOS_NEW_SPELL);
        player:messageSpecial(KEYITEM_OBTAINED,SHANTOTTOS_NEW_SPELL);  -- add new spell key item
        player:setVar("golemday",0);
        player:setVar("golemyear",0);
        player:setVar("golemwait",0);
    end
end;