-----------------------------------
-- Area: Vunkerl_Inlet_[S] 83
--  NPC: qm6 (???)
-- Involved In Quest: EVIL_AT_THE_INLET
-- !pos -635.385 -51.101 -454.311
-----------------------------------
package.loaded["scripts/zones/Vunkerl_Inlet_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Vunkerl_Inlet_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local Eati = player:getQuestStatus(CRYSTAL_WAR,EVIL_AT_THE_INLET);

    if (Eati == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.EVIL_WARDING_SEAL) == true) then
        player:startEvent(112);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 112 and option == 0) then
        player:delKeyItem(dsp.ki.EVIL_WARDING_SEAL);
    end
end;
