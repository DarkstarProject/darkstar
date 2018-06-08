-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: ???
-- Involved in Quests: Acting in Good Faith
-- @zone 195
-- !pos -17 0 59 (I-10)
-- !pos
-- !pos
-- !pos
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/The_Eldieme_Necropolis/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local ActingInGoodFaith = player:getQuestStatus(WINDURST,ACTING_IN_GOOD_FAITH);

    if (ActingInGoodFaith == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.SPIRIT_INCENSE) == true) then
        player:startEvent(50);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;
--
function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 50 and option == 0) then
        player:messageSpecial(dsp.ki.SPIRIT_INCENSE_EMITS_PUTRID_ODOR,dsp.ki.SPIRIT_INCENSE);
        player:delKeyItem(dsp.ki.SPIRIT_INCENSE);
    end
end;