-----------------------------------
-- Area: Kuftal Tunnel
-- Mob: Robber Crab
-----------------------------------

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)

	checkGoVregime(killer,mob,735,1);
	checkGoVregime(killer,mob,736,1);
	checkGoVregime(killer,mob,738,1);

	local mobID = mob:getID();

	if (mobID == 17490232) then -- Crab for Cancer spawn
		GetNPCByID(17490254):hideNPC(900); -- qm2 in npc_list
	end

end;
