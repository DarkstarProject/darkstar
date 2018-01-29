-----------------------------------
-- Area: Batallia Downs
--  NPC: Luck Rune
--  Involved in Quest: Mhaura Fortune
-- !pos -362.167 -12.199 157.158 105
-----------------------------------
package.loaded["scripts/zones/Batallia_Downs/TextIDs"] = nil;
-------------------------------------
require("scripts/zones/Batallia_Downs/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_THE_ORDINARY);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;