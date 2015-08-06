-----------------------------------	
-- Area: Quicksand Caves
-- MOB:  Tribunus_VII-I
-----------------------------------	

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	GetNPCByID(17629661):hideNPC(900); -- qm2 in npc_list
end;