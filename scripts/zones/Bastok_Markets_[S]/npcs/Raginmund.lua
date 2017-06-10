-----------------------------------
-- Area: Bastok Markets (S)
-- NPC:  Raginmund
-- Involved in Quest: Too Many Chefs
-- Standard Info NPC
-- Location L-10
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getVar("TOO_MANY_CHEFS") == 2) then
        player:startEvent(0x0070); -- part 3 Too Many Chefs
    else
        player:startEvent(0x006f); -- standard
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
    if (csid == 0x0070) then
        player:setVar("TOO_MANY_CHEFS",3);
    end
end;
