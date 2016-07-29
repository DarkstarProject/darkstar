-----------------------------------
-- Area: Sauromugue Champaign
-- NPC:  Tiger Bones
-- Involed in Quest: The Fanged One.
-- @pos 666 -8 -379 120
-------------------------------------
package.loaded["scripts/zones/Sauromugue_Champaign/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Sauromugue_Champaign/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getQuestStatus(WINDURST,THE_FANGED_ONE) == QUEST_ACCEPTED) then

        local oldTiger = 17268808;
        local tigerAction = GetMobAction(oldTiger);
        local fangedOneCS = player:getVar("TheFangedOneCS");

        if (player:hasKeyItem(OLD_TIGERS_FANG) == false and
            fangedOneCS == 2) then

            player:addKeyItem(OLD_TIGERS_FANG);
            player:messageSpecial(KEYITEM_OBTAINED, OLD_TIGERS_FANG);
            player:setVar("TheFangedOneCS", 0);

        elseif (tigerAction == ACTION_NONE and fangedOneCS == 1) then

            SpawnMob(oldTiger):addStatusEffect(EFFECT_POISON,40,10,210);
            player:messageSpecial(OLD_SABERTOOTH_DIALOG_I);
        else
            player:messageSpecial(NOTHING_HAPPENS);
        end;
end;
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
--printf("RESULT: %u",option);

end;
