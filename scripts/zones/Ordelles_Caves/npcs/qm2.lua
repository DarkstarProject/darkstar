-----------------------------------
-- Area: Ordelle's Caves
--  NPC: ??? (qm2)
-- Involved in Quest: A Squire's Test II
-- !pos -94 1 273 193
-------------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
local ID = require("scripts/zones/Ordelles_Caves/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST_II) == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.STALACTITE_DEW) == false and player:getVar("SquiresTestII") == 0) then
        player:setVar("SquiresTestII",os.time());
        player:messageSpecial(ID.text.A_SQUIRE_S_TEST_II_DIALOG_I);
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;