-----------------------------------
-- Area: Temple Of Uggalepih
-- MOB:  Habetrot
-- @pos -60 -8 58 220
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   GetNPCByID(17428871):hideNPC(900); -- 15min, qm8 in npc_list
end;