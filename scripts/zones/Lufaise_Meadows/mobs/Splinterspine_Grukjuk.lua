-----------------------------------
-- Area: Lufaise Meadows (24)
--  MOB: Splinterspine_Grukjuk
-----------------------------------
package.loaded["scripts/zones/Lufaise_Meadows/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Lufaise_Meadows/TextIDs");
require("scripts/globals/quests");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(OTHER_AREAS,A_HARD_DAY_S_KNIGHT) == QUEST_ACCEPTED) then
        player:setVar("SPLINTERSPINE_GRUKJUK",2);
    end

end;
