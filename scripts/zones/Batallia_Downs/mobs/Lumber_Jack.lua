-----------------------------------
--  Area: Batallia Downs (105)
--   Mob: Lumber Jack
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

    -- Set Weeping Willow's respawn time (21-24 hours)
    GetMobByID(17207302):setRespawnTime(math.random((75600),(86400)));

end;
