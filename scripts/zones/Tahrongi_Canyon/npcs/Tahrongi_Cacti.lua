-----------------------------------
-- Area: Tahrongi Canyon
-- NPC:  Tahrongi Cacti
-- Involved in Quest: Say It with Flowers
--
-- @pos -308.721 7.477 264.454
-----------------------------------
package.loaded["scripts/zones/Tahrongi_Canyon/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/zone");
require("scripts/zones/Tahrongi_Canyon/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getQuestStatus(WINDURST,SAY_IT_WITH_FLOWERS) == QUEST_ACCEPTED and player:getVar("FLOWER_PROGRESS") == 1 and player:hasItem(950) == false) then
        --Meets conditions to receive a Tahrongi Cactus flower
        if (player:getFreeSlotsCount() > 0) then
            --Meets inventory space requirements, throws item receipt message in game
            player:addItem(950);
            player:messageSpecial(BUD_BREAKS_OFF,950);
        else
            --Inventory is full, throws error message in game
            player:messageSpecial(CANT_TAKE_ANY_MORE);
        end;
        --No further scripting required as this item could also be obtained through gardening.  This trigger should simply provide the player the item if they already do not have one (no quest updates or cutscenes required)!
    else
        --Not on the Say It With Flowers quest
        player:messageSpecial(POISONOUS_LOOKING_BUDS);
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
end;