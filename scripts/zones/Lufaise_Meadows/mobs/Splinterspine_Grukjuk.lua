-----------------------------------
-- Area: Lufaise Meadows (24)
--  MOB: Splinterspine_Grukjuk
-----------------------------------
package.loaded["scripts/zones/Lufaise_Meadows/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Lufaise_Meadows/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_GIL_MAX, -1);
end;

function onMobDeath(mob, player, isKiller)
    if (player:getQuestStatus(OTHER_AREAS,A_HARD_DAY_S_KNIGHT) == QUEST_ACCEPTED) then
        player:setVar("SPLINTERSPINE_GRUKJUK",2);
    end
end;
