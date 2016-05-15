-----------------------------------
-- Area: Wajaom Woodlands
-- Mob:  Percipient Zoraal Ja
-----------------------------------

require("scripts/zones/Wajaom_Woodlands/MobIDs");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 300);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- OnMobFight Action
-----------------------------------

function onMobFight(mob, target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local pet = GetMobByID(Zoraal_Ja_s_Pkuucha);

    pet:setUnkillable(false);
    if (pet:getHPP() <= 1) then
        pet:setHP(0);
    end
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    if (mob:getHPP() > 0) then
        SetServerVariable("[POP]Percipient_Zoraal_Ja", 0);
    end    
end;
