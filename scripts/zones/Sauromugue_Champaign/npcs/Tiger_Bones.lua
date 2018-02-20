-----------------------------------
-- Area: Sauromugue Champaign
-- NPC:  Tiger Bones
-- Involed in Quest: The Fanged One.
-- !pos 666 -8 -379 120
-------------------------------------
package.loaded["scripts/zones/Sauromugue_Champaign/TextIDs"] = nil;
-------------------------------------
require("scripts/zones/Sauromugue_Champaign/TextIDs");
require("scripts/zones/Sauromugue_Champaign/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local fangedOne = player:getQuestStatus(WINDURST,THE_FANGED_ONE);
    local fangedOneCS = player:getVar("TheFangedOneCS");

    -- THE FANGED ONE
    if (fangedOne == QUEST_ACCEPTED and fangedOneCS == 1 and not GetMobByID(OLD_SABERTOOTH):isSpawned()) then
        SpawnMob(OLD_SABERTOOTH):addStatusEffect(EFFECT_POISON,40,10,210);
        player:messageSpecial(OLD_SABERTOOTH_DIALOG_I);
    elseif (fangedOne == QUEST_ACCEPTED and fangedOneCS == 2 and not player:hasKeyItem(OLD_TIGERS_FANG)) then
        player:addKeyItem(OLD_TIGERS_FANG);
        player:messageSpecial(KEYITEM_OBTAINED, OLD_TIGERS_FANG);
        player:setVar("TheFangedOneCS", 0);
        
    -- DEFAULT DIALOG
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end;
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
