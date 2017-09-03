-----------------------------------
-- Area: Monastic Cavern
-- NPC:  Altar
-- Involved in Quests: The Circle of Time
-- !pos 108 -2 -144 150
-----------------------------------
package.loaded["scripts/zones/Monastic_Cavern/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Monastic_Cavern/MobIDs");
require("scripts/zones/Monastic_Cavern/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local circleOfTime = player:getQuestStatus(JEUNO,THE_CIRCLE_OF_TIME);

    -- CIRCLE OF TIME (Bard AF3)
    if (circleOfTime == QUEST_ACCEPTED and player:hasKeyItem(STAR_RING1) and player:hasKeyItem(MOON_RING)) then
        if (player:getVar("circleTime") == 7 and GetMobByID(BUGABOO):isDead()) then
            SpawnMob(BUGABOO):updateClaim(player);
        elseif (player:getVar("circleTime") == 8) then
            player:startEvent(0x03); -- Show final CS
        else
            player:messageSpecial(ALTAR);
        end;

    -- DEFAULT DIALOG
    else
        player:messageSpecial(ALTAR);
    end;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- CIRCLE OF TIME
    if (csid == 0x03) then
        player:setVar("circleTime",9); -- After bugaboo is killed, and final CS shows up
        player:delKeyItem(MOON_RING);
        player:delKeyItem(STAR_RING1);
    end;
end;
