-----------------------------------	
-- Area: Quicksand Caves
-- MOB:  Princeps IV-XLV
-- Pops in Bastok mission 8-1 "The Chains that Bind Us"
-----------------------------------	

require("scripts/globals/settings");
require("scripts/zones/Quicksand_Caves/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------
function onMobDeath(mob,killer)
	if(killer:getCurrentMission(BASTOK) == THE_CHAINS_THAT_BIND_US) and (killer:getVar("MissionStatus") == 1) then
		SetServerVariable("Bastok8-1LastClear", os.time());
	end
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------
function onMobEngaged(mob, target)
end;

-----------------------------------
-- onMobDisengage Action
-----------------------------------
function onMobDisengage(mob)
	local self = mob:getID();
	DespawnMob(self, 120);
end;

-----------------------------------
-- onMobDespawn Action
-----------------------------------
function onMobDespawn(mob)
	local mobsup = GetServerVariable("BastokFight8_1");
	SetServerVariable("BastokFight8_1",mobsup - 1);
	
	if(GetServerVariable("BastokFight8_1") == 0) then
		local npc = GetNPCByID(17629734); -- qm6
		npc:setStatus(0); -- Reappear
	end
end;
