-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Gu'Dha Effigy
-- Mega Boss
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/dynamis");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	if(alreadyReceived(killer,8) == false) then
		addDynamisList(killer,128);
		
		killer:addTimeToDynamis(30); -- Add + 30min
		
		killer:addTitle(DYNAMISBASTOK_INTERLOPER); -- Add title
		
		local npc = GetNPCByID(17539319); -- Spawn ???
		npc:setPos(mob:getXPos(),mob:getYPos(),mob:getZPos());
		npc:setStatus(0);
		
		killer:launchDynamisSecondPart(); -- Spawn dynamis second part
	end
	
end;