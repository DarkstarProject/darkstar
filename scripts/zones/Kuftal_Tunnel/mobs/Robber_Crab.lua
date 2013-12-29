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

	mobID = mob:getID();

	if(mobID == 17490232) then -- Crab for Cancer spawn
		GetNPCByID(17490251):hideNPC(900);
  end

end;
