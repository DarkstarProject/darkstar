-----------------------------------
-- Area: LaLoff Amphitheater
--  MOB: Ark Angel MR
-----------------------------------
package.loaded["scripts/zones/LaLoff_Amphitheater/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/LaLoff_Amphitheater/TextIDs");
require("scripts/globals/status");

-----------------------------------

-- TODO: Allegedly has a 12 hp/sec regen.  Determine if true, and add to onMobInitialize if so.

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

-- TODO: Summons pet when party is engaged.  Randomly chosen between Tiger and Mandragora.
--       Current victory system doesn't readily support a random choice of pet while having
--       the pet as a victory condition.  Therefore, Mandragora just isn't used at this time.

   local mobid = mob:getID()

   for member = mobid-1, mobid+6 do
      if (GetMobAction(member) == 16) then
         GetMobByID(member):updateEnmity(target);
      end
   end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)
    local charm = mob:getLocalVar("Charm");

    if (charm == 0 and mob:getHPP() <  50) then
        mob:useMobAbility(710);
        mob:setLocalVar("Charm",1);
    end
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;
