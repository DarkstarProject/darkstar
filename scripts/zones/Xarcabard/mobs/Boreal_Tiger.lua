-----------------------------------
-- Area: Xarcabard
--  NM:  Boreal Tiger
-- Involved in Quests: Atop the Highest Mountains
-- @pos 341 -29 370 112
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
    -- Failsafe to make sure NPC is down when NM is up
    local npc = GetNPCByID(17236308);
    if (OldSchoolG2 == true) then
        npc:showNPC(1);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local npc = GetNPCByID(17236308);
    if (player:getQuestStatus(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS) == QUEST_ACCEPTED and player:hasKeyItem(ROUND_FRIGICITE) == false) then
        player:messageSpecial(BLOCKS_OF_ICE);
    end
    npc:showNPC(FrigiciteDuration);

end;