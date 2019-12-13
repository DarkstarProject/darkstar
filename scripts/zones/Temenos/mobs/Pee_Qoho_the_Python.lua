-----------------------------------
-- Area: Temenos
--  Mob: Pee Qoho the Python
-----------------------------------
require("scripts/globals/limbus");
-----------------------------------

function onMobEngaged(mob,target)
  if   (IsMobDead(16929023)==true and IsMobDead(16929024)==true and IsMobDead(16929025)==true and
        IsMobDead(16929026)==true and IsMobDead(16929027)==true and IsMobDead(16929028)==true
    ) then
       mob:setMod(dsp.mod.SLASHRES,1400);
       mob:setMod(dsp.mod.PIERCERES,1400);
       mob:setMod(dsp.mod.IMPACTRES,1400);
       mob:setMod(dsp.mod.HTHRES,1400);
  else
      mob:setMod(dsp.mod.SLASHRES,300);
      mob:setMod(dsp.mod.PIERCERES,300);
      mob:setMod(dsp.mod.IMPACTRES,300);
      mob:setMod(dsp.mod.HTHRES,300);
  end
  GetMobByID(16929005):updateEnmity(target);
  GetMobByID(16929006):updateEnmity(target);
end;

function onMobDeath(mob, player, isKiller)
          if (IsMobDead(16929005)==true and IsMobDead(16929006)==true and IsMobDead(16929007)==true) then
            GetNPCByID(16928768+78):setPos(-280,-161,-440);
            GetNPCByID(16928768+78):setStatus(dsp.status.NORMAL);
            GetNPCByID(16928768+473):setStatus(dsp.status.NORMAL);
          end
end;