-----------------------------------
-- Area: Apollyon CS
--  MOB: Carnagechief_Jackbodokk
-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Apollyon/TextIDs");
require("scripts/globals/limbus");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    local mobID = mob:getID();
    local X = mob:getXPos();
    local Y = mob:getYPos();
    local Z = mob:getZPos();
    SpawnMob(16933130):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
    SpawnMob(16933131):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
    SpawnMob(16933132):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    local mobID = mob:getID();
    local X = mob:getXPos();
    local Y = mob:getYPos();
    local Z = mob:getZPos();
    local lifepourcent= ((mob:getHP()/mob:getMaxHP())*100);
    local instancetime = target:getSpecialBattlefieldLeftTime(5);


    if (lifepourcent < 50 and GetNPCByID(16933245):getAnimation() == 8) then
        SpawnMob(16933134):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
        SpawnMob(16933135):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
        SpawnMob(16933133):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
        SpawnMob(16933136):setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
        GetNPCByID(16933245):setAnimation(9);
    end

    if (instancetime < 13) then
        if (IsMobDead(16933144) == false) then  --link  dee wapa
            GetMobByID(16933144):updateEnmity(target);
        elseif (IsMobDead(16933137) == false) then  --link na qba
            GetMobByID(16933137):updateEnmity(target);
        end
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if ((IsMobDead(16933144) == false or IsMobDead(16933137) == false) and alreadyReceived(player,1,GetInstanceRegion(1294)) == false) then
        player:addTimeToSpecialBattlefield(5,5);
        addLimbusList(player,1,GetInstanceRegion(1294));
    end
end;
