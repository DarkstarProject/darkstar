-----------------------------------
-- Area: Wajaom Woodlands
-- Mob:  Zoraal Ja's Pkuucha
-----------------------------------

require("scripts/zones/Wajaom_Woodlands/MobIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("Pop_Zoraal_Ja", math.random(20,50));
end;

-----------------------------------
-- OnMobFight Action
-----------------------------------

function onMobFight(mob, target)
    if (mob:getHPP() <= mob:getLocalVar("Pop_Zoraal_Ja") and GetMobAction(Percipient_Zoraal_Ja) == ACTION_NONE
        and GetServerVariable("[POP]Percipient_Zoraal_Ja") == 0) then

        GetMobByID(Percipient_Zoraal_Ja):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5));
        SpawnMob(Percipient_Zoraal_Ja):updateEnmity(target);
        mob:setHP(mob:getMaxHP());
        mob:setUnkillable(true);
        SetServerVariable("[POP]Percipient_Zoraal_Ja", os.time());
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    SetServerVariable("[POP]Percipient_Zoraal_Ja", 0 );

    SetServerVariable("[POP]Zoraal_Ja_s_Pkuucha", os.time(t) + math.random(1800, 43200)); -- 30min to 12h
    DeterMob(mob:getID(), true);

    local PH = GetServerVariable("[PH]Zoraal_Ja_s_Pkuucha");
    SetServerVariable("[PH]Zoraal_Ja_s_Pkuucha", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
end;
