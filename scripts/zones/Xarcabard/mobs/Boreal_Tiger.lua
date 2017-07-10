-----------------------------------
-- Area: Xarcabard
--  NM:  Boreal Tiger
-- Involved in Quests: Atop the Highest Mountains
-- @pos 341 -29 370 112
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Xarcabard/TextIDs");

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
    -- Failsafe to make sure NPC is down when NM is up
    if (OldSchoolG2) then
        GetNPCByID(17236308):showNPC(0);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (OldSchoolG2) then
        -- show ??? for desired duration
        -- notify people on the quest who need the KI
        GetNPCByID(17236308):showNPC(FrigiciteDuration);
        if (player:getQuestStatus(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS) == QUEST_ACCEPTED and player:hasKeyItem(ROUND_FRIGICITE) == false) then
            player:messageSpecial(BLOCKS_OF_ICE);
        end
    end
end;