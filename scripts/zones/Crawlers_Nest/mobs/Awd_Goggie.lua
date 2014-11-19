-----------------------------------
-- Area: 
-- NPC:  Awd_Goggie
-- Area: Crawler's Nest
-- NPC:  Awd Goggie
-- @pos -253.026 -1.867 253.055 197
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(BOGEYDOWNER);
	GetNPCByID(17584460):hideNPC(900); -- qm7
end;