-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC:  Abda Lurabda
-- Standard Info NPC
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/pets");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getMainJob() == JOBS.PUP) then
        player:startEvent(0x288, 0, 9800, player:getGil());
    else
        player:startEvent(0x101);
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
    --printf("CSID: %u",csid);
    --printf("RESULT: %d",option);
    
    if (csid == 0x288 and bit.band(option, 0x80000000) ~= 0) then
        player:delGil(9800);
        local page = bit.band(option, 0xF);
        local val = bit.rshift(bit.band(option, 0xFFFFF0), 4);
        player:setPetName(PETTYPE_AUTOMATON,86 + val + page*32);
        player:messageSpecial(5747);
    end
end;