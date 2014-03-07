-----------------------------------
-- Area: Xarcabard
-- NM: Boreal Coeurl
-- Involved in Quests: Atop the Highest Mountains
-- @pos 580 -9 290 112
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn
-----------------------------------

function OnMobSpawn(mob)
    -- Failsafe to make sure NPC is down when NM is up
    local npc = GetNPCByID(17236299);
    if(OldSchoolG2 == true) then
        npc:showNPC(1);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    local npc = GetNPCByID(17236299);
    local DALEQuest = killer:getVar("DALEQuest");
    if(killer:getQuestStatus(JEUNO,THE_MIRACULOUS_DALE) == QUEST_ACCEPTED) then
        DALEQuest = killer:setMaskBit(DALEQuest,"DALEQuest",2,true);
    end
    if(killer:getQuestStatus(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS) == QUEST_ACCEPTED and killer:hasKeyItem(SQUARE_FRIGICITE) == false) then
        killer:messageSpecial(BLOCKS_OF_ICE);
    end
    npc:showNPC(FrigiciteDuration);
end;