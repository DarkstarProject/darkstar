-----------------------------------
-- Area: Xarcabard
-- NM:   Boreal Tiger
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

function onMobDeath(mob, killer)

	local npc = GetNPCByID(17236304);
	if (killer:getQuestStatus(JEUNO,ATOP_THE_HIGHEST_MOUNTAINS) == QUEST_ACCEPTED and killer:hasKeyItem(ROUND_FRIGICITE) == false) then
		killer:messageSpecial(BLOCKS_OF_ICE);
	end
	npc:showNPC(FrigiciteDuration);

end;