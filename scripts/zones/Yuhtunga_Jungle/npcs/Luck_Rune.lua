-----------------------------------
-- Area: Yuhtunga Jungle
--  NPC: Luck Rune
--  Involved in Quest: Mhaura Fortune
-- !pos -95.486 11.188 418.153 123
-----------------------------------
package.loaded["scripts/zones/Yuhtunga_Jungle/TextIDs"] = nil;
-------------------------------------
require("scripts/zones/Yuhtunga_Jungle/TextIDs");
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