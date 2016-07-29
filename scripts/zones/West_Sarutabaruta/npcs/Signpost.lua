-----------------------------------
-- Area: West Sarutabaruta
-- NPC:  Signpost (18 total)
-----------------------------------
package.loaded["scripts/zones/West_Sarutabaruta/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/West_Sarutabaruta/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (npc:getID() == 17248823) or (npc:getID() == 17248824) then
        player:messageSpecial(SIGN_1);
    elseif (npc:getID() == 17248825) or (npc:getID() == 17248826) then
        player:messageSpecial(SIGN_3);
    elseif (npc:getID() == 17248827) or (npc:getID() == 17248828) then
        player:messageSpecial(SIGN_5);
    elseif (npc:getID() == 17248829) or (npc:getID() == 17248830) then
        player:messageSpecial(SIGN_7);
    elseif (npc:getID() == 17248831) or (npc:getID() == 17248832) then
        player:messageSpecial(SIGN_9);
    elseif (npc:getID() == 17248833) or (npc:getID() == 17248834) then
        player:messageSpecial(SIGN_11);
    elseif (npc:getID() == 17248835) or (npc:getID() == 17248836) then
        player:messageSpecial(SIGN_13);
    elseif (npc:getID() == 17248837) or (npc:getID() == 17248838) then
        player:messageSpecial(SIGN_15);
    elseif (npc:getID() == 17248839) or (npc:getID() == 17248840) then
        player:messageSpecial(SIGN_17);
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
--print("CSID: %u",csid);
--print("RESULT: %u",option);
end;