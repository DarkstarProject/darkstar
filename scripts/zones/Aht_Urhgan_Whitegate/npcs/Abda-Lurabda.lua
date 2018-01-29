-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Abda Lurabda
-- Standard Info NPC
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/pets");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getMainJob() == JOBS.PUP) then
        player:startEvent(648, 0, 9800, player:getGil());
    else
        player:startEvent(257);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %d",option);

    if (csid == 648 and bit.band(option, 0x80000000) ~= 0) then
        player:delGil(9800);
        local page = bit.band(option, 0xF);
        local val = bit.rshift(bit.band(option, 0xFFFFF0), 4);
        player:setPetName(PETTYPE_AUTOMATON,86 + val + page*32);
        player:messageSpecial(5747);
    end
end;