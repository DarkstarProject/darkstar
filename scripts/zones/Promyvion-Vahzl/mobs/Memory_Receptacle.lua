-----------------------------------
-- Area: Promyvion-Vahzl
--  MOB: Memory Receptacle
-- Todo: clean up disgustingly bad formatting
-----------------------------------
package.loaded["scripts/zones/Promyvion-Vahzl/TextIDs"] = nil;
-----------------------------------
require( "scripts/zones/Promyvion-Vahzl/TextIDs" );
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------
function onMobInitialize(mob)
    mob:addMod(MOD_REGAIN, 100); -- 10% Regain for now
    mob:SetAutoAttackEnabled(false); -- Recepticles only use TP moves.
end;


-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob, target)

     local Mem_Recep = mob:getID();

    -- This will serve as a ghetto Regain (not damage dependent) based on kjlotus's testing. Caps at 100

     if (mob:getTP() < 900) then
             mob:addTP(100);
     end

     if (Mem_Recep == 16867382 or Mem_Recep == 16867387) then -- Floor 1
       for i = Mem_Recep+1, Mem_Recep+3 do -- Keep pets linked
          if (GetMobAction(i) == 16) then
             GetMobByID(i):updateEnmity(target);
           end
        end
     elseif (Mem_Recep == 16867429 or Mem_Recep == 16867436 or Mem_Recep == 16867494 or Mem_Recep == 16867501 or Mem_Recep == 16867508 or -- Floor 2/3
      Mem_Recep == 16867515) then
       for i = Mem_Recep+1, Mem_Recep+5 do
          if (GetMobAction(i) == 16) then
             GetMobByID(i):updateEnmity(target);
           end
        end
     elseif (Mem_Recep == 16867586 or Mem_Recep == 16867595 or Mem_Recep == 16867604) then -- Floor 4
       for i = Mem_Recep+1, Mem_Recep+7 do
          if (GetMobAction(i) == 16) then
             GetMobByID(i):updateEnmity(target);
           end
        end
   end

   -- Summons a single stray every 30 seconds.

   if (mob:getBattleTime() % 30 < 3 and mob:getBattleTime() > 3 and (Mem_Recep == 16867382 or Mem_Recep == 16867387) and mob:AnimationSub() == 2) then -- Floor 1
      for i = Mem_Recep+1, Mem_Recep+3 do
         if (GetMobAction(i) == 0) then -- My Stray is deeaaaaaad!
                 mob:AnimationSub(1);
            SpawnMob(i):updateEnmity(target);
            GetMobByID(i):setPos(mob:getXPos()+1, mob:getYPos(), mob:getZPos()+1); -- Set stray x and z position +1 from Recepticle
            return;
         end
      end
   elseif (mob:getBattleTime() % 30 < 3 and mob:getBattleTime() > 3 and (Mem_Recep == 16867429 or Mem_Recep == 16867436 or Mem_Recep == 16867494 or -- Floor 2/3
    Mem_Recep == 16867501 or Mem_Recep == 16867508 or Mem_Recep == 16867515) and mob:AnimationSub() == 2) then
      for i = Mem_Recep+1, Mem_Recep+5 do
         if (GetMobAction(i) == 0) then
                 mob:AnimationSub(1);
            SpawnMob(i):updateEnmity(target);
            GetMobByID(i):setPos(mob:getXPos()+1, mob:getYPos(), mob:getZPos()+1); -- Set stray x and z position +1 from Recepticle
            return;
         end
      end
   elseif (mob:getBattleTime() % 30 < 3 and mob:getBattleTime() > 3 and (Mem_Recep == 16867586 or Mem_Recep == 16867595 or Mem_Recep == 16867604) and -- Floor 4
    mob:AnimationSub() == 2) then
      for i = Mem_Recep+1, Mem_Recep+7 do
         if (GetMobAction(i) == 0) then
                 mob:AnimationSub(1);
            SpawnMob(i):updateEnmity(target);
            GetMobByID(i):setPos(mob:getXPos()+1, mob:getYPos(), mob:getZPos()+1);
            return;
         end
      end
   else
           mob:AnimationSub(2);
   end
end;


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();
    local difX = player:getXPos()-mob:getXPos();
    local difY = player:getYPos()-mob:getYPos();
    local difZ = player:getZPos()-mob:getZPos();
    local killeranimation = player:getAnimation();
    local Distance = math.sqrt( math.pow(difX,2) + math.pow(difY,2) + math.pow(difZ,2) ); --calcul de la distance entre les "killer" et le memory receptacle

    mob:AnimationSub(0); -- Set ani. sub to default or the recepticles wont work properly

    switch (mob:getID()) : caseof {
        [16867387] = function (x)
        GetNPCByID(16867700):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                player:startEvent(32);
            end
        end,
        [16867382] = function (x)
        GetNPCByID(16867699):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                    player:startEvent(33);
            end
        end,
        [16867429] = function (x)
        GetNPCByID(16867697):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                    player:startEvent(30);
            end
        end,
        [16867436] = function (x)
        GetNPCByID(16867698):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                    player:startEvent(31);
            end
        end,
        [16867501] = function (x)
        GetNPCByID(16867703):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                    player:startEvent(35);
            end
        end,
        [16867515] = function (x)
        GetNPCByID(16867705):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                    player:startEvent(36);
            end
        end,
        [16867494] = function (x)
        GetNPCByID(16867702):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                    player:startEvent(37);
            end
        end,
        [16867508] = function (x)
        GetNPCByID(16867704):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                    player:startEvent(38);
            end
        end,
        [16867604] = function (x)
        GetNPCByID(16867707):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                    player:startEvent(34);
            end
        end,
        [16867586] = function (x)
        GetNPCByID(16867701):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                    player:startEvent(39);
            end
        end,
        [16867595] = function (x)
        GetNPCByID(16867706):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                    player:startEvent(40);
            end
        end,
    }
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;
