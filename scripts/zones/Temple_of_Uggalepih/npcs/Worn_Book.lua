-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Worn Book
-- Getting "Old Rusty Key (keyitem)"
-- !pos 59 0 19 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/zones/Temple_of_Uggalepih/MobIDs");
require("scripts/globals/keyitems");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:hasKeyItem(OLD_RUSTY_KEY) or player:hasKeyItem(PAINTBRUSH_OF_SOULS)) then
        player:messageSpecial(NO_REASON_TO_INVESTIGATE);
    else
        local offset = npc:getID() - UGGALEPIH_BOOK_OFFSET;
        player:startEvent(61 + offset);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    local book = player:getVar("paintbrushOfSouls_book");

    if (csid == 61 and option == 1 and (book == 0 or book == 2 or book == 4 or book == 6)) then
        player:setVar("paintbrushOfSouls_book",book + 1);
    elseif (csid == 62 and option == 1 and (book == 0 or book == 1 or book == 4 or book == 5)) then
        player:setVar("paintbrushOfSouls_book",book + 2);
    elseif (csid == 63 and option == 1 and (book == 0 or book == 1 or book == 2 or book == 3)) then
        player:setVar("paintbrushOfSouls_book",book + 4);
    end

    if (player:getVar("paintbrushOfSouls_book") == 7) then
        player:messageSpecial(FALLS_FROM_THE_BOOK,OLD_RUSTY_KEY);
        player:addKeyItem(OLD_RUSTY_KEY);
        player:messageSpecial(KEYITEM_OBTAINED,OLD_RUSTY_KEY);
        player:setVar("paintbrushOfSouls_book",0);
    end
end;
