-----------------------------------
-- Area: Fort Ghelsba
--  NM:  Orcish Panzer
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    local OrcFighter = 17354895;
    local Chariotbuster = 17354896;
    local ToD = GetServerVariable("Chariotbuster_Byakzak");
    if (ToD <= os.time(t)) then -- It's NM time, so spawn Chariotbuster Byakzak
        SpawnMob(Chariotbuster,600):updateEnmity(killer);
    else -- Not NM time yet, so spawn normal Orcish Fighter instead
        SpawnMob(OrcFighter,600):updateEnmity(killer);
    end
end;