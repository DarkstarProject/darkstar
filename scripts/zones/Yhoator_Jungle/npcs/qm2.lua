-----------------------------------
-- Area: Yhoator Jungle
--  NPC: ??? Used for Norg quest "Stop Your Whining"
-- !pos -94.073 -0.999 22.295 124
-----------------------------------
package.loaded["scripts/zones/Yhoator_Jungle/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Yhoator_Jungle/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local StopWhining = player:getQuestStatus(OUTLANDS,STOP_YOUR_WHINING);

    if (StopWhining == QUEST_ACCEPTED and player:hasKeyItem(dsp.kis.BARREL_OF_OPOOPO_BREW) == false and player:hasKeyItem(dsp.kis.EMPTY_BARREL)) then
        player:messageSpecial(TREE_CHECK);
        player:addKeyItem(dsp.kis.BARREL_OF_OPOOPO_BREW); --Filled Barrel
        player:messageSpecial(KEYITEM_OBTAINED,dsp.kis.BARREL_OF_OPOOPO_BREW);
        player:delKeyItem(dsp.kis.EMPTY_BARREL); --Empty Barrel
    elseif (StopWhining == QUEST_ACCEPTED and player:hasKeyItem(dsp.kis.BARREL_OF_OPOOPO_BREW) == true) then
        player:messageSpecial(TREE_FULL); --Already have full barrel
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
        if (csid == 1) then
            player:addKeyItem(dsp.kis.SEA_SERPENT_STATUE);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.kis.SEA_SERPENT_STATUE);
        end
end;