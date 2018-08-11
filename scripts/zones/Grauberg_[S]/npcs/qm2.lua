-----------------------------------
-- Area: Grauberg [S]
--  NPC: qm2 (???)
-- Involved In Quest: The Fumbling Friar
-- Zone 89
-- !pos 79.876 -1.169 457.219
-----------------------------------
package.loaded["scripts/zones/Grauberg_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Grauberg_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local FumblingFriar = player:getQuestStatus(CRYSTAL_WAR,THE_FUMBLING_FRIAR);
    local OrnatePackage = player:hasKeyItem(dsp.ki.ORNATE_PACKAGE);

    if (FumblingFriar == QUEST_ACCEPTED and OrnatePackage == false) then
        player:addKeyItem(dsp.ki.ORNATE_PACKAGE);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.ORNATE_PACKAGE);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
     --printf("CSID2: %u",csid);
     --printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)
     --printf("CSID: %u",csid);
     --printf("RESULT: %u",option);
end;


