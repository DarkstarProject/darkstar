-----------------------------------
-- Area: Arrapago Reef
-- NPC:  Velionis
-----------------------------------

require("/scripts/globals/fieldsofvalor");
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
	mob:addMod(MOD_MACC,420);
	mob:addMod(MOD_MATT,115);
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function OnMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;