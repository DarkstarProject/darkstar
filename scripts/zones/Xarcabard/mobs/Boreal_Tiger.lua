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
    local npc = GetNPCByID(17236304);
    if (OldSchoolG2 == true) then
        npc:showNPC(1);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)

    local npc = GetNPCByID(17236304);
    if (ally:getQuestStatus(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS) == QUEST_ACCEPTED and ally:hasKeyItem(ROUND_FRIGICITE) == false) then
        ally:messageSpecial(BLOCKS_OF_ICE);
    end
    npc:showNPC(FrigiciteDuration);

end;