-----------------------------------
-- Area: Dynamis Jeuno
-- NPC:  Goblin Golem
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/dynamis");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	killer:addTitle(DYNAMISJEUNO_INTERLOPER); -- Add title
	
	local npc = GetNPCByID(17547510); -- Spawn ???
	npc:setPos(mob:getXPos(),mob:getYPos(),mob:getZPos());
	npc:setStatus(0);
	
	killer:launchDynamisSecondPart(); -- Spawn dynamis second part
	
end;