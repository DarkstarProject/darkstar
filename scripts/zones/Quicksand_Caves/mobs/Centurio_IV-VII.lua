-- Centurio IV-VII
-- by ReaperX (Convert to DSP by Hypnotoad)
-- Pops in Bastok mission 8-1 "The Chains that Bind Us"

require("scripts/globals/settings");
require("scripts/zones/Quicksand_Caves/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function onMobSpawn(mob)
	-- print(mob:getName());
end;

function onMobDeath(mob,killer)
	if(killer:getCurrentMission(BASTOK) == THE_CHAINS_THAT_BIND_US) and (killer:getVar("MissionStatus") == 1) then
		SetServerVariable("Bastok8-1LastClear", os.time());
	end
end;

function onMobEngaged(mob, target)
end;

function onMobDisengage(mob, weather)
	-- printf("Disengaging Centurio");
	local self = mob:getID();
	DespawnMob(self, 120);
end;

function onMobDespawn(mob)
	-- printf("Despawning Centurio");
	local mobsup = GetServerVariable("BastokFight8_1");
	SetServerVariable("BastokFight8_1",mobsup - 1);
	
	if(GetServerVariable("BastokFight8_1") == 0) then
		-- printf("No more mobs: last is Centurio");

		local npc = GetNPCByID(17629728);
		npc:setStatus(0); -- Reappear
	end
end;
