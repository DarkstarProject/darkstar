-----------------------------------
-- Area: Fort Ghelsba
--  NM:  Orcish Panzer
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (isKiller == true) then
        local OrcFighter = 17354895;
        local Chariotbuster = 17354896;
        local ToD = GetServerVariable("Chariotbuster_Byakzak");
        if (ToD <= os.time(t)) then -- It's NM time, so spawn Chariotbuster Byakzak
            SpawnMob(Chariotbuster):updateClaim(player);
            GetMobByID(Chariotbuster):setPos( mob:getXPos(), mob:getYPos(), mob:getZPos(), 0);
        else -- Not NM time yet, so spawn normal Orcish Fighter instead
           SpawnMob(OrcFighter):updateClaim(player);
           GetMobByID(OrcFighter):setPos( mob:getXPos(), mob:getYPos(), mob:getZPos(), 0);
        end
    end
end;
